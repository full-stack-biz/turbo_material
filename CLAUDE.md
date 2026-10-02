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
- `gem build turbo_material.gemspec` / `gem push turbo_material-*.gem` — release

Test coverage is minimal; components are verified visually via Lookbook previews in the dummy app (`lib/lookbook/*_preview.rb`).

## Architecture

A component is spread across four places, all sharing the component name:
- `app/helpers/turbo_material/<name>_helper.rb` — public helper (`material_<name>(options)`), normalizes options and renders the partial
- `app/views/components/_<name>.html.erb` — markup
- `app/assets/javascripts/turbo_material/material_<name>_controller.js` — Stimulus controller that instantiates the MDC JS object
- `lib/lookbook/<name>_preview.rb` — preview/docs

Adding a component also requires registering its helper in `lib/turbo_material/engine.rb` (helpers are added explicitly, not autoloaded into host controllers). JS needs no pin: `config/importmap.rb` uses `pin_all_from app/assets/javascripts`.

Engine wiring (`lib/turbo_material/engine.rb`):
- Adds `config/importmap.rb` to the host's importmap; host loads controllers via `eagerLoadControllersFrom("turbo_material", application)`
- Registers itself with `tailwindcss-rails` engines; Tailwind source is `app/assets/tailwind/turbo_material/engine.css`, compiled output in `app/assets/dist/turbo_material/tailwind.css`
- Host app imports it with `@import "../builds/tailwind/turbo_material.css";`

Install generator (`lib/generators/turbo_material/install_generator.rb`, invoked by `rails turbo_material:install`; `turbo_material:update_tailwind` runs it with `--update-tailwind-only`) adds MDC CDN links to the layout, the Tailwind import, and the Stimulus import.

Server-backed components (chips input/select) depend on Turbo and a server endpoint (`url`) that renders the options HTML.
