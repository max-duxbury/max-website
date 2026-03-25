# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Serve locally with live reload
bundle exec jekyll serve

# Build to _site/
bundle exec jekyll build

# Install dependencies
bundle install
```

## Architecture

This is a Jekyll static site. Currently in early stages — only an `index.html` exists with no Jekyll front matter, meaning Jekyll passes it through as a static file rather than processing it as a layout-based page.

To use Jekyll features (layouts, includes, Liquid templating, front matter), files need YAML front matter (`---` blocks). The built site outputs to `_site/`.
