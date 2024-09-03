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

- [Input](#input)
- [Checkbox](#checkbox)
- [Radio button](#radio-button)
- [Switch button](#switch-button)
- [Select](#select)
- [Chip Set](#chip-set)
- [Chip](#chip)
- [Chips Input](#chips-input)
- [Chips Select](#chips-select)
- [Data Table](#data-table)
- [Data Table Row Checkbox](#data-table-row-checkbox)
- [Data Table Sortable Header](#data-table-sortable-header)
- [Data Table Header](#data-table-header)
- [Menu Button](#menu-button)
- [Modal](#modal)
- [Tooltip](#tooltip)

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

### Chip Set

Implements [Material Design Chip Set](https://github.com/material-components/material-components-web/tree/master/packages/mdc-chips) component.

```erb
<%= material_chip_set chips: [{label: 'Chip 1'}, {label: 'Chip 2'}] %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `chips` | Array | Array of chips to be included in the chip set |

### Chip

Implements [Material Design Chip](https://github.com/material-components/material-components-web/tree/master/packages/mdc-chips) component.

```erb
<%= material_chip label: 'Chip' %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `label` | String | Chip label text |

### Chips Input

Implements [Material Design Chips Input](https://github.com/material-components/material-components-web/tree/master/packages/mdc-chips) component.

```erb
<%= material_chips_input form: form, name: 'tags', label: 'Tags', selected: [{label: 'Tag 1'}, {label: 'Tag 2'}], options: [{label: 'Option 1'}, {label: 'Option 2'}] %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `form` | Object | Form object |
| `disabled` | Boolean | Whether the input is disabled |
| `required` | Boolean | Whether the input is required |
| `name` | String | Name of the input |
| `label` | String | Input label text |
| `id` | String | ID of the input |
| `frame` | String | Frame of the input |
| `suffix` | String | Suffix of the input |
| `type` | String | Type of the input |
| `url` | String | URL for fetching options |
| `selected` | Array | Array of selected chips |
| `options` | Array | Array of available options |
| `value` | String | Value of the input |
| `fixed` | Boolean | Whether the input is fixed |
| `prefetch` | Boolean | Whether to prefetch options |
| `additional_query_params` | Hash | Additional query parameters |

### Chips Select

Implements [Material Design Chips Select](https://github.com/material-components/material-components-web/tree/master/packages/mdc-chips) component.

```erb
<%= material_chips_select form: form, name: 'tags', label: 'Tags', options: [{label: 'Option 1', value: '1'}, {label: 'Option 2', value: '2'}] %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `form` | Object | Form object |
| `disabled` | Boolean | Whether the select is disabled |
| `required` | Boolean | Whether the select is required |
| `name` | String | Name of the select |
| `label` | String | Select label text |
| `id` | String | ID of the select |
| `value` | String | Value of the select |
| `url` | String | URL for fetching options |
| `frame` | String | Frame of the select |
| `source_override` | String | Source override for the select |
| `options` | Array | Array of available options |
| `confirmable` | Boolean | Whether the select is confirmable |
| `query_string` | String | Query string for fetching options |
| `modal_name` | String | Name of the modal |
| `modal_url` | String | URL of the modal |
| `chip_css` | String | CSS class for the chip |
| `fixed` | Boolean | Whether the select is fixed |

### Data Table

Implements [Material Design Data Table](https://github.com/material-components/material-components-web/tree/master/packages/mdc-data-table) component.

```erb
<%= material_data_table name: 'Users', table_body: 'users-table-body', url: users_path, table_params: params, records: @users, selected_records: @selected_users, pagy: @pagy, table_headers_partial: 'users/table_headers', table_contents_partial: 'users/table_contents' %>
```

#### Options

| Option | Type | Description                      |
| --- | --- |----------------------------------|
| `name` | String | Name of the data table           |
| `table_body` | String | ID of the table body             |
| `url` | String | URL for fetching table data      |
| `table_params` | Hash | Parameters for the table         |
| `records` | Array | Array of records to be displayed |
| `selected_records` | Array | Array of selected records        |
| `pagy` | Object | Pagy object for pagination       |
| `table_headers_partial` | String | Partial name for table headers   |
| `table_contents_partial` | String | Partial name for table contents  |

### Data Table Row Checkbox

Implements [Material Design Data Table Row Checkbox](https://github.com/material-components/material-components-web/tree/master/packages/mdc-data-table) component.

```erb
<%= material_data_table_row_checkbox id: record.id, checked: @selected_users.include?(record.id.to_s) %>
```

#### Options

| Option | Type | Description                      |
| --- | --- |----------------------------------|
| `id` | String | ID of the row checkbox           |
| `checked` | Boolean | Whether the row checkbox is checked |

### Data Table Sortable Header

Implements [Material Design Data Table Sortable Header](https://github.com/material-components/material-components-web/tree/master/packages/mdc-data-table) component.

```erb
<%= material_data_table_sortable_header label: 'First Name', sort_value: aria_sort('first_name'), column_id: 'first_name' %>
```

#### Options

| Option | Type | Description                      |
| --- | --- |----------------------------------|
| `label` | String | Label of the sortable header   |
| `sort_value` | String | Value of the sortable header  |
| `column_id` | String | ID of the sortable header     |

##### aria_sort Helper

`aria_sort` helper is used to generate sort value for the header. It accepts one argument, which is the column name. It returns `descending` or `ascending` value depending on the current values of `params[:order]` and `params[:reverse]`.

```erb
<%= aria_sort('first_name') %>
```


### Data Table Header

Implements [Material Design Data Table Header](https://github.com/material-components/material-components-web/tree/master/packages/mdc-data-table) component.

```erb
<%= material_data_table_header %>
```

#### Options

| Option | Type | Description                      |
| --- | --- |----------------------------------|
| `label` | String | Label of the header            |
| `column_id` | String | ID of the header              |

### Menu Button

Implements [Material Design Menu Button](https://github.com/material-components/material-components-web/tree/master/packages/mdc-menu) component.

```erb
<%= material_menu_button button_text: 'Menu', menu_contents_partial: 'common/menu_contents' %>
```
or with block
```erb
<%= material_menu_button button_text: 'Menu' do %>
  Contents
<% end %>
```

#### Options

| Option | Type | Description |
| --- | --- | --- |
| `button_text` | String | Text of the menu button |
| `menu_contents_partial` | String | Partial for menu contents |
| `logout_path` | String | Path for logout |
| `custom_css` | String | Custom CSS class |
| `custom_surface_css` | String | Custom CSS class for the menu surface |

### Modal

Implements [Material Design Modal](https://github.com/material-components/material-components-web/tree/master/packages/mdc-dialog) component.

```erb
<%= material_modal title: 'Modal Title', contents_partial: 'common/modal_contents' %>
```
or with block
```erb
<%= material_modal title: 'Modal Title' do %>
  Contents
<% end %>
```

#### Options

| Option | Type | Description               |
| --- | --- |-------------------------------------------------------------------------|
| `title` | String | Title of the modal |
| `contents_partial` | String | Partial for modal contents |
| `cancel_button_text` | String | Text of the cancel button |
| `ok_button_text` | String | Text of the ok button     |
| `opened` | Boolean | Whether the modal is opened |
| `dialog_surface_custom_css` | String | Custom CSS class for the dialog surface |
| `close_action_url` | String | URL for navigating to on modal close |
| `form` | Object | Form object for form-centric modals, replaces ok button with form submit |

### Tooltip

Implements [Material Design Tooltip](https://github.com/material-components/material-components-web/tree/master/packages/mdc-tooltip) component.

```erb
<%= material_tooltip id: dom_id(record) do %>
  Tooltip content
<% end %>
```

#### Options

| Option | Type | Description                          |
| --- | --- |--------------------------------------|
| `id` | String | DOM ID of the element we displaying the tooltip for |

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
