# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

TurboMaterial is a Rails engine gem providing Material Design components (Material Components for the Web, loaded via CDN) for Hotwire apps using Turbo, Stimulus, Importmaps and Tailwind CSS.

## Commands

- `bundle install`
- `bundle exec rake test` — run tests (engine tests run against `test/dummy`)
- `bin/rails test test/integration/navigation_test.rb:LINE` — run a single test/file
- `bundle exec rubocop` — lint (config inherits `.rubocop_todo.yml`)
- `bin/dev` (root `Procfile.dev`) — dummy app server on port 3200 + `app:tailwindcss:watch`
- `cd test/dummy && bin/rails console` — console in the dummy app
- `bin/tailwindcss-builder` — legacy standalone Tailwind watch build into `app/assets/dist` (uses `config/tailwind.config.js`)
- Release: git-flow (`release/vX.Y.Z` from `develop` → `main`, tag `vX.Y.Z`; see the `git-flow` skill). Pushing `main` triggers `.github/workflows/gem-push.yml`, which builds and pushes the gem to RubyGems — don't `gem push` by hand.

Test coverage is minimal: `test/helpers/components_helper_test.rb` is a smoke test that renders every `material_*` helper with minimal locals — add an assertion there for each new component. Otherwise components are verified in the browser via Lookbook previews in the dummy app (`lib/lookbook/*_preview.rb`, at `http://127.0.0.1:3200/lookbook/preview/<name>/default`). Previews ship with the gem, so partials they render live in the engine (`app/views/common/`, `app/views/lookbook/`), not in `test/dummy`. `bin/dev` exits without a TTY; run `bin/rails server --port 3200` plus `bin/rails app:tailwindcss:build` instead. Code in `lib/` (e.g. `version.rb`) needs a server restart.

In ERB partials `block_given?` is always true; branch on a local (e.g. `contents_partial`) instead.

## Architecture

A component is spread across four places, all sharing the component name:
- `app/helpers/turbo_material/<name>_helper.rb` — public helper (`material_<name>(options)`), normalizes options and renders the partial
- `app/views/components/_<name>.html.erb` — markup
- `app/assets/javascripts/turbo_material/material_<name>_controller.js` — Stimulus controller that instantiates the MDC JS object
- `lib/lookbook/<name>_preview.rb` — preview/docs

`lib/turbo_material/engine.rb` registers every `app/helpers/turbo_material/*_helper.rb` into host controllers automatically. JS needs no pin: `config/importmap.rb` uses `pin_all_from app/assets/javascripts`.

Engine wiring (`lib/turbo_material/engine.rb`):
- Adds `config/importmap.rb` to the host's importmap; host loads controllers via `eagerLoadControllersFrom("turbo_material", application)`
- Registers itself with `tailwindcss-rails` engines; Tailwind source is `app/assets/tailwind/turbo_material/engine.css`, compiled output in `app/assets/dist/turbo_material/tailwind.css`
- Host app imports it with `@import "../builds/tailwind/turbo_material.css";`

Install generator (`lib/generators/turbo_material/install_generator.rb`, invoked by `rails turbo_material:install`; `turbo_material:update_tailwind` runs it with `--update-tailwind-only`) adds MDC CDN links to the layout, the Tailwind import, and the Stimulus import. The CDN links carry SRI hashes from `lib/turbo_material/version.rb` (`MDC_CSS_SRI`/`MDC_JS_SRI`); update them with `MDC_VERSION` from `https://data.jsdelivr.com/v1/packages/npm/material-components-web@<version>`.

`config/importmap.rb` pins `hotkeys-js` because `stimulus-use` imports it; don't remove it.

Server-backed components (chips input/select) depend on Turbo and a server endpoint (`url`) that renders the options HTML.
