# `turbo_material` Changelog

## v0.3.4

### Breaking

- `TurboMaterial.configure` and `TurboMaterial::Configuration` are removed (they configured nothing)
- The list controller dispatches `material-list:action` instead of `country-select-focus` on item action; update listeners
- `material_input` no longer forces `autocomplete="new-password"`; pass `autocomplete:` to set it

### Security

- Chips input and select build chips with DOM APIs and `textContent` and escape selector values, so chip labels can no longer inject HTML
- Publishing the gem requires MFA (`rubygems_mfa_required`)

### Fixed

- Every Stimulus controller destroys its MDC instance on disconnect, so Turbo navigation no longer leaks MDC components and listeners
- Chips input's `keydown.enter` action was invalid and never fired
- Modal, outlined select and chips input get unique ARIA ids; textarea gets an `aria-label`
- Data table controller no longer carries app-specific code

### Added

- Modal `title_css` option
- `material_input` `autocomplete:` option

### Changed

- Allow `importmap-rails` 2.1 and later 2.x (`~> 2.0` instead of `~> 2.0.1`), required by Rails 8.1's `stale_when_importmap_changes`
- MDC is pinned to 14.0.0 (`TurboMaterial::MDC_VERSION`) in the CDN links the install generator adds
- Helpers are registered into host controllers by the engine automatically

## v0.3.0

### Upgrade to Tailwind CSS v4

This version upgrades to Tailwind CSS v4. It also utilizes `tailwindcss-rails` experimental Rails Engine support.
