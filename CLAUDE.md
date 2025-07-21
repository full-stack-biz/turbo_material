# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

TurboMaterial is a Ruby gem that provides Material Design components for Hotwire Turbo applications. It integrates Material Components for the Web with Rails applications using Turbo, Stimulus, and Tailwind CSS.

## Common Commands

### Development Setup
- `bundle install` - Install gem dependencies
- `bin/rails turbo_material:install` - Install the gem and add necessary files to the host application

### Testing
- `bundle exec rake test` - Run the test suite
- `cd test/dummy && bin/rails server` - Start the test/dummy Rails application for development

### Gem Management
- `gem build turbo_material.gemspec` - Build the gem
- `gem push turbo_material-*.gem` - Publish gem to RubyGems

### Development with Dummy App
The `test/dummy` directory contains a full Rails application used for testing and development:
- `cd test/dummy && bin/rails console` - Rails console in dummy app
- `cd test/dummy && bin/rails server` - Start dummy app server
- `cd test/dummy && bin/dev` - Start development server with hot reloading (if Procfile.dev exists)

## Code Architecture

### Engine Structure
This is a Rails engine (`lib/turbo_material/engine.rb`) that:
- Isolates namespace under `TurboMaterial`
- Registers view helpers for all Material components
- Integrates with Tailwind CSS and Importmap
- Adds asset paths and precompilation for JavaScript and CSS

### Component Organization
- **Views**: `app/views/components/` - ERB templates for Material components
- **Helpers**: `app/helpers/turbo_material/` - One helper per component type
- **JavaScript Controllers**: `app/assets/javascripts/turbo_material/` - Stimulus controllers
- **Styles**: `app/assets/stylesheets/turbo_material/` and `app/assets/tailwind/turbo_material/`
- **Lookbook Previews**: `lib/lookbook/` - Component documentation and previews

### Key Components
The gem provides 17+ Material Design components including:
- Form components (input, checkbox, radio, switch, select, textarea)
- Data components (chips, data tables)
- UI components (modals, tooltips, menu buttons)
- Each component has corresponding helper, view template, and Stimulus controller

### Installation Generator
`lib/generators/turbo_material/install_generator.rb` automates:
- Adding Material Components Web CDN links to application layout
- Adding Tailwind import for turbo_material.css
- Configuring Stimulus controllers import

### Dependencies
- **Rails**: 7.1.2+ required
- **Stimulus**: For JavaScript interactivity
- **Turbo**: Required for server-based components like chips
- **Tailwind CSS**: For styling integration
- **Importmaps**: For JavaScript module loading
- **Material Components Web**: Loaded via CDN

### Development Dependencies
- **Lookbook**: Component documentation system
- **Carmen**: Country data (for select examples)
- **RuboCop**: Code linting

## Helper Methods Pattern

Each component follows a consistent helper pattern:
- Helper method takes options hash and optional block
- Returns rendered partial with processed options
- Common options: `form`, `name`, `id`, `label`, `disabled`, `required`
- Complex components may have additional options like `url`, `options`, `selected`

## Stimulus Controllers

Controllers are prefixed with `material_` and follow naming convention:
- `material_input_controller.js`
- `material_checkbox_controller.js` 
- etc.

Controllers initialize Material Components Web JavaScript for interactive behavior.

## Asset Management

- CSS assets compiled to `app/assets/dist/`
- JavaScript assets in `app/assets/javascripts/turbo_material/`
- Tailwind config integrates engine assets
- Engine manifest loaded via `turbo_material_manifest.js`