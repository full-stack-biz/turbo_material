# TurboMaterial

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

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
