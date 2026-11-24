# `turbo_material` Changelog

## v0.3.6

### Fixed

- Data table again uses the host's `per_page_options` helper when `per_page_options:` is not passed; 0.3.5 replaced it with 10/25/50/100
- Chips input: `selected:` chips given as `{ value:, label: }` lost their value in 0.3.5, and `value: ''` kept the selected ids out of the hidden field; both work again
- Chips input and select no longer put empty values in the hidden field
- `material-live-form` keeps its state in `window.materialLiveForm`, so it no longer shares state with a host `live-form` controller

## v0.3.5

### Breaking

- Data table's rows-per-page form uses the gem's new `material-live-form` controller instead of the host's `live-form`, and takes its choices from a `per_page_options:` local (default 10/25/50/100) instead of a host `per_page_options` helper
- `material_radio` passes `required:` to its inputs (it was ignored), so a required radio now blocks submit until a choice is made
- Chips input's search box starts empty instead of showing the stored value
- Drawer without `data-material-drawer-opened-value` no longer closes itself and sends `PUT close-url` on every page load

### Fixed

- Chips select: removing a chip removed it from the hidden value only in the UI; the removed value was still submitted
- Chips select: a selected value missing from `options` crashed the controller
- Chips input: `selected:` chips had no value, so adding a chip wiped them from the hidden field; they now carry `data-value` and a remove icon, and the hidden field defaults to their ids
- Chips input: removing a chip could remove the first chip instead of the clicked one
- Menu button and modal never rendered `menu_contents_partial` / `contents_partial` (they always yielded the empty block)
- Menu button: clicking the button again reopened the menu instead of closing it
- Switch used a fixed `id="selected-switch"`, so labels of all switches pointed at the first one; it now uses `id:`
- Chip set referenced a non-existent `material-chipset` controller
- Data table "select all" checkbox no longer renders as selected
- Validation messages in input, select and textarea use `role="alert"` instead of `aria-hidden`, so screen readers announce them
- Engine no longer adds a missing `turbo_material/application.js` to precompile, and skips asset config when the host has no asset pipeline

### Added

- `material_radio` `options:` (`[{ value:, label: }]`), default Yes/No
- `material_data_table` `per_page_options:`
- `material-live-form` Stimulus controller (debounced auto-submit, keeps focus across Turbo re-renders)
- Install generator writes MDC CDN links over `https` with SRI (`TurboMaterial::MDC_CSS_SRI`, `MDC_JS_SRI`)
- Lookbook previews for data table, drawer, chip set and tooltip

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
