# frozen_string_literal: true

# Emits /tags/<path>/ pages for hierarchical, slash-separated tags.
#
# This plugin exists for one reason: Liquid cannot create files. Sorting and
# rendering stay in the layout. Raw Documents and reading-item Hashes go into
# page.data["items"] untouched — Liquid calls .to_liquid on retrieval, so a
# Document becomes a DocumentDrop and a Hash stays a Hash, and a single
# {% for %} handles both. Do not normalise them into a common shape here.
#
# Cloudflare Pages runs `bundle exec jekyll build` itself, so _plugins/ is fine.
# This would NOT work on GitHub Pages.
module Jekyll
  class TagPageGenerator < Generator
    safe true

    # Tags are used verbatim as URL path segments, so the URL always equals the
    # tag. That invariant is enforced here rather than maintained as a two-way
    # slug map — a mangled tag is an authoring mistake worth hearing about.
    VALID_TAG = %r{\A[a-z0-9][a-z0-9_-]*(/[a-z0-9][a-z0-9_-]*)*\z}

    def generate(site)
      index = Hash.new { |h, k| h[k] = [] }

      taggable(site).each do |item|
        tags_for(item).each do |raw|
          tag = raw.to_s.downcase
          unless tag.match?(VALID_TAG)
            Jekyll.logger.warn "Tags:", "skipping #{raw.inspect} — expected " \
              "lowercase [a-z0-9_-] segments separated by /"
            next
          end
          # Expand into every ancestor prefix so /tags/mathematics/ collects
          # everything beneath it. Substring matching would be wrong here:
          # `cs/systems` must not match `foo/cs/systems`.
          parts = tag.split("/")
          (1..parts.size).each { |n| index[parts.first(n).join("/")] << item }
        end
      end

      all = index.keys.sort
      index.each do |tag, items|
        site.pages << tag_page(site, tag, items.uniq, all)
        site.pages << tag_feed(site, tag, items.uniq)
      end
      site.pages << index_page(site, index, all)
    end

    private

    # Projects carry tags too, and a tag shown on a project page that led
    # nowhere would be a broken link. They have no `date`, so give them one
    # from `updated` to keep the mixed sort uniform.
    #
    # It must be a Time, not the Date that YAML hands back: Jekyll's publisher
    # calls date.to_i on every document, and Date#to_i does not exist.
    def taggable(site)
      projects = site.collections["projects"]&.docs || []
      projects.each do |p|
        next if p.data["date"]
        stamp = p.data["updated"] || p.data["started"]
        next if stamp.nil?
        p.data["date"] = stamp.respond_to?(:to_time) ? stamp.to_time : stamp
      end
      site.posts.docs + projects + Array(site.data["reading"])
    end

    def tags_for(item)
      Array(item.is_a?(Hash) ? item["tags"] : item.data["tags"])
    end

    def ancestors(tag)
      parts = tag.split("/")
      (1...parts.size).map { |n| parts.first(n).join("/") }
    end

    def children(all, tag)
      depth = tag.count("/") + 1
      all.select { |t| t.start_with?("#{tag}/") && t.count("/") == depth }
    end

    def tag_page(site, tag, items, all)
      page = PageWithoutAFile.new(site, site.source, "tags/#{tag}", "index.html")
      page.data.merge!(
        "layout"    => "tag",
        "title"     => tag.split("/").last,
        "tag"       => tag,
        "items"     => items,
        "ancestors" => ancestors(tag),
        "children"  => children(all, tag),
        # Otherwise jekyll-sitemap sweeps every one of these into sitemap.xml.
        "sitemap"   => false
      )
      page
    end

    # Atom per tag. jekyll-sitemap ignores these on its own: they are not html
    # and their url does not end in "/".
    def tag_feed(site, tag, items)
      page = PageWithoutAFile.new(site, site.source, "tags/#{tag}", "feed.xml")
      page.data.merge!("layout" => "tag_feed", "tag" => tag, "items" => items)
      page
    end

    def index_page(site, index, all)
      page = PageWithoutAFile.new(site, site.source, "tags", "index.html")
      page.data.merge!(
        "layout" => "tag_index",
        "title"  => "Tags",
        "tags"   => all.map do |t|
          { "path" => t, "leaf" => t.split("/").last,
            "depth" => t.count("/"), "count" => index[t].uniq.size }
        end
      )
      page
    end
  end
end
