# CLAUDE.md

mode: get-it-done

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

Bundler on `PATH` is broken — system Ruby 2.6 tries to load a bundler built for
3.4.1. Prefix every command:

```bash
export PATH="$HOME/.rubies/ruby-3.4.1/bin:$PATH"

bundle exec jekyll serve    # local, live reload
bundle exec jekyll build    # build to _site/
bundle install
```

## Architecture

Jekyll 4.4.1 static site, deployed on **Cloudflare Pages** (build command
`bundle exec jekyll build`). Not GitHub Pages — so `_plugins/` and arbitrary
gems are permitted. The root `CNAME` is a leftover GitHub Pages artefact and is
a no-op here.

- `_posts/` — blog posts. A post may opt into a project with `project: <slug>`,
  which makes it appear in that project's note stream *in addition to* the main
  blog index, at the same canonical URL.
- `_projects/` — collection, `output: true`, permalink `/projects/:name/`. Each
  doc is a living document: the writeup is edited in place and carries an
  `updated:` field, with its note stream rendered below it.
- `_data/` — `cv.yml` drives `cv.md`; `reading.yml` drives the reading stream.
- `assets/css/main.css` — plain CSS, no Sass. All colour goes through custom
  properties defined once in `:root`.

**Project membership and tags are different relations.** `project:` is
one-to-many containment. Tags are many-to-many topic and deliberately cross-cut
projects. Nothing in the tag system reads `project:`, and nothing in the project
system reads `tags:`.

Tags are hierarchical and slash-separated (`mathematics/algebraic_topology`).
Display the leaf, link the full path.
