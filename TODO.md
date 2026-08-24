# TODO

Private notes — `TODO.md` is excluded from the build in `_config.yml`.

## Content

- [ ] Write the four drafts in `_drafts/` (all four bodies are still `TODO.`).
      Preview with `bundle exec jekyll serve --drafts`; publish by moving a
      file back to `_posts/` under its `YYYY-MM-DD-title.md` name.
- [ ] Fill `_data/reading.yml` with real entries — it is down to two.
- [ ] Add the oil-field internship to `_data/cv.yml` under `experience` once
      it starts. `/now` already says "about to start"; keep the two in step.
- [ ] Add `_projects/` entries as work becomes shareable (only `aes.md` left).
- [ ] `/now` still mentions the Raft project, whose `_projects/raft.md` was
      deleted. Fine as prose, but decide.

## Ship

- [ ] Merge `rework-phase1` into `main` and push — Phases 1–6 are local only,
      the live site is still `1cee478`.
- [ ] Confirm Cloudflare Pages is on build image **v3** and that Node 22 is
      picked up. Server-side KaTeX fails *silently* green: an orange `.kdmath`
      block on a maths page is the canary.

## Deliberately not doing

- Tag filtering on the blog index — revisit past ~20 posts.
- Post descriptions on the index — same.

## Done

- [x] Phases 1–6: project note streams, hierarchical tags, reading stream,
      `/now`, dark-only palette, server-side KaTeX + per-tag Atom feeds
- [x] Styling, 404, favicon, OG image, RSS in the footer
- [x] Deploy on Cloudflare Pages (`bundle exec jekyll build`)
