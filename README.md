# Material Components for Hotwire Turbo

This gem implements drop-in implementation for [Material Design](https://material.io/) in [Turbo](https://turbo.hotwire.dev/). It is based on [Material Components for the Web](https://github.com/material-components/material-components-web) as it's being most feature rich implementation at the moment.

## Requirements

* Ruby 3.3+ (might work with older versions, but not tested)
* Rails 7.1+ (Turbo is hard requirement for complex components like server based Chips)
* Turbo 
* Stimulus
* Importmaps
* Tailwind 

That list is based on the project from which this library is being extracted. If you like to make it less demanding, feel free to submit PRs. Only strict requirements are Turbo and Stimulus.

## Usage

Add following to your `app/javascript/controllers/index.js` after `eagerLoadControllersFrom("controllers", application)` line:

```javascript
eagerLoadControllersFrom("turbo_material", application)
```
Add following to your `app/view/layouts/application.html.erb` in `<head>` section:

```erb
<link href="//cdn.jsdelivr.net/npm/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/material-components-web@latest/dist/material-components-web.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%= stylesheet_link_tag "turbo_material/tailwind.css" %>
```

### Material Components for Web customizations

For supporting custom styling for you components, consider including following in your application stylesheet:

```css
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,600;1,400;1,600&display=swap');

html, body, label {
    font-family: 'Roboto', sans-serif;
}

html, body {
    scroll-behavior: smooth;
}

html [id], body [id] {
    scroll-margin: 120px !important;
}

:root {
    --real-primary: #5d7dd4;
    --real-secondary: #607D8B;
    --real-warn: rgb(244, 67, 54);

    --mdc-theme-primary: var(--real-primary);
    --mdc-theme-secondary: var(--real-secondary);
    --mdc-dialog-z-index: 100;
    --mdc-ripple-color: white;
}

.turbo-progress-bar {
    background-color: #77a1d6;
    filter: brightness(90%);
}

.mdc-button.menu-item {
    --mdc-theme-primary: white;
}

.mdc-button--accent:not(.mdc-button--raised):not([disabled]) {
    color: #77a1d6;
    color: var(--mdc-theme-secondary, #77a1d6);
}

.mdc-button--accent.mdc-button--raised:not([disabled]) {
    background-color: #77a1d6;
    background-color: var(--mdc-theme-secondary, #77a1d6);
}

.mdc-button.mdc-button--accent .mdc-button__ripple::before, .mdc-button.mdc-button--accent .mdc-button__ripple::after {
    background-color: #77a1d6;
    background-color: var(--mdc-theme-secondary, #77a1d6);
}

.mdc-button--warn:not(.mdc-button--raised):not([disabled]) {
    color: rgb(244, 67, 54);
    color: var(--real-warn, rgb(244, 67, 54));
}

.mdc-button--warn.mdc-button--raised:not([disabled]) {
    background-color: rgb(244, 67, 54);
    background-color: var(--real-warn, rgb(244, 67, 54));
}

.mdc-button.mdc-button--warn .mdc-button__ripple::before, .mdc-button.mdc-button--warn .mdc-button__ripple::after {
    background-color: rgb(244, 67, 54);
    background-color: var(--real-warn, rgb(244, 67, 54));
}

.mdc-button--white:not(.mdc-button--raised):not([disabled]) {
    color: white;
}

.mdc-button--white.mdc-button--raised:not([disabled]) {
    background-color: white;
}

.mdc-button.mdc-button--white .mdc-button__ripple::before, .mdc-button.mdc-button--white .mdc-button__ripple::after {
    background-color: white;
}

.mdc-text-field:not(.mdc-text-field--label-floating) .iti__flag-container {
    display: none !important;
}

.mdc-drawer .mdc-deprecated-list-item {
    margin: 0;
    border-radius: 0;
}

aside.mdc-drawer:not(.mdc-drawer--right) {
    box-shadow: 0px 5px 5px -3px rgb(0 0 0 / 20%), 0px 8px 10px 1px rgb(0 0 0 / 14%), 0px 3px 14px 2px rgb(0 0 0 / 12%);
}

aside.mdc-drawer.main-drawer {
    background-color: #2d323e;
}

.mdc-drawer--right.mdc-drawer--dismissible {
    right: 0 !important;
    left: initial !important;
}

.mdc-drawer--right.mdc-drawer.mdc-drawer--open:not(.mdc-drawer--closing) + .mdc-drawer-app-content {
    margin-right: 16rem !important;
    margin-left: 0 !important;
}

.mdc-drawer--right.mdc-drawer.mdc-drawer--open.mdc-drawer--closing + .mdc-drawer-app-content {
    transition: margin-right 200ms 15ms linear;
}

.mdc-drawer--right.mdc-drawer.mdc-drawer--open.mdc-drawer--openening.mdc-drawer--closing + .mdc-drawer-app-content {
    transition: margin-right 200ms 15ms linear;
}

.mdc-drawer--right.mdc-drawer--animate {
    transform: translateX(100%) !important;
}

.mdc-drawer--right.mdc-drawer--closing {
    transform: translateX(100%) !important;
}

.mdc-drawer--right.mdc-drawer--opening {
    transform: translateX(0) !important;
}

.mdc-dialog__title::before {
    content: none !important;
}

.mdc-dialog__title {
    padding-top: 1rem;
}

.clip-path-bottom {
    clip-path: inset(-8px -8px 0px -8px);
}

.clip-path-top {
    clip-path: inset(0px -8px -8px -8px);
}

.mdc-drawer.mdc-drawer--open:not(.mdc-drawer--closing) + .mdc-drawer-app-content .mdc-top-app-bar {
    width: calc(100vw - 16rem);
}

.mdc-text-field .field_with_errors {
    width: 100%;
}

.bg-secondary .mdc-tab-indicator .mdc-tab-indicator__content--underline {
    border-color: white !important;
}

.bg-secondary .mdc-tab--active .mdc-tab__text-label {
    color: white !important;
}

.bg-secondary .mdc-tab .mdc-tab__icon {
    color: white !important;
}

.bg-secondary .mdc-tab--active .mdc-tab__icon {
    color: white !important;
}

.bg-secondary .mdc-tab:not(.mdc-tab--active) .mdc-tab__text-label {
    color: white !important;
}

.mdc-chip.red {
    background-color: #f44336 !important;
    color: white !important;
}

.mdc-chip.red .mdc-chip__icon {
    color: white !important;
}
```

## Tailwind Forms customizations leakage

This gem uses Tailwind for additional customizations, I am noticed that `@tailwindcss/forms` leaking to Material inputs adding partial white backgrounds. For now I would recommend to disable forms plugin while using this gem.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "turbo_material"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install turbo_material
```

## Available components

### Input

Implements [Material Design Textfield](https://github.com/material-components/material-components-web/tree/master/packages/mdc-textfield) component.

```erb
<%= material_input label: 'New password', name: 'password', required: true, parent: resource,
                   id: "user-password", form: form, type: 'password',
                   value: resource.password %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `label` | String | Input label text |
| `name` | String | Name of the input |
| `required` | Boolean | Whether the input is required |
| `disabled` | Boolean | Whether the input is disabled |
| `parent` | Object | Parent object |
| `id` | String | ID of the input |
| `form` | Object | Form object |
| `type` | String | Type of the input conforming to HTML input type specification (e.g., text, password) |
| `value` | String | Value of the input |
| `style` | String | Style of the input (filled, outlined) |
| `custom_css` | String | Custom CSS class |
| `custom_controller` | String | Custom Stimulus controller |


### Checkbox

Implements [Material Design Checkbox](https://github.com/material-components/material-components-web/tree/master/packages/mdc-checkbox) component.

```erb
<%= material_checkbox name: 'remember_me', id: 'remember-me', form: form, label: 'Remember me' %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `name` | String | Checkbox name |
| `id` | String | Checkbox ID |
| `form` | Object | Form object |
| `label` | String | Checkbox label |
| `disabled` | Boolean | Whether the checkbox is disabled |
| `checked` | Boolean | Whether the checkbox is checked |
| `checked_value` | String | Value when the checkbox is checked |
| `unchecked_value` | String | Value when the checkbox is unchecked |
| `source_override` | String | Used to populate checkbox value from another form field |

### Radio button

Implements [Material Design Radio button](https://github.com/material-components/material-components-web/tree/master/packages/mdc-radio) component.

```erb
<%= material_radio name: 'option', id: 'option-1', form: form, label: 'Option 1' %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `name` | String | Radio button name |
| `id` | String | Radio button ID |
| `form` | Object | Form object |
| `label` | String | Radio button label |
| `disabled` | Boolean | Whether the radio button is disabled |
| `value` | String | Radio button value |
| `parent` | Object | Radio button parent |

### Switch button

Implements [Material Design Switch button](https://github.com/material-components/material-components-web/tree/master/packages/mdc-switch) component.

```erb
<%= material_switch label: 'Switch', true_label: 'On', false_label: 'Off' %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `label` | String | Switch button label text |
| `disabled` | Boolean | Whether the switch is disabled |
| `required` | Boolean | Whether the switch is required |
| `true_label` | String | Text that displays when switch is on |
| `false_label` | String | Text that displays when switch is off |

### Select

Implements [Material Design Select](https://github.com/material-components/material-components-web/tree/master/packages/mdc-select) component.

```erb
<%= material_select name: 'country', id: 'country', form: form, options: Carmen::Country.all, selected_text: 'Select country' %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `name` | String | Select name |
| `id` | String | Select ID |
| `disabled` | Boolean | Whether the select is disabled |
| `required` | Boolean | Whether the select is required |
| `form` | Object | Form object |
| `options` | Array | Select options |
| `selected_text` | String | Text that displays when nothing is selected |
| `fixed` | Boolean | Whether select uses `mdc-menu-surface--fixed` or `mdc-menu-surface--fullwidth` |
| `outlined` | Boolean | Whether the select is outlined |
| `additional_classes` | String | Additional CSS classes for select |
| `hint` | String | Hint text to display |


## Lookbook documentation for components

Gem implements [Lookbook](https://lookbook.build) documentation for all components. To use it in the application, add `gem 'lookbook'` to your Gemfile and run `bundle install`. Then add following to your `config/application.rb`:

```ruby
config.lookbook.preview_paths = [TurboMaterial::Engine.root.join('lib/lookbook')]
config.lookbook.preview_controller = 'TurboMaterial::LookbookController'
```

Or extend your existing config for `lookbook.preview_paths` with same value.

## Contributing
This gem is open for new contributions. Use [Material Components for Web documentation](https://github.com/material-components/material-components-web/tree/master/packages) as a references for missing functionality.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
