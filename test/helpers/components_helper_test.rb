# frozen_string_literal: true

require 'test_helper'

# Smoke test: every component renders with minimal locals.
class ComponentsHelperTest < ActionView::TestCase
  helper TurboMaterial::ApplicationHelper

  setup do
    view.extend(*TurboMaterial.constants.map { |c| TurboMaterial.const_get(c) }
                              .select { |m| m.is_a?(Module) && m.name.end_with?('Helper') })
  end

  def form
    @form ||= ActionView::Helpers::FormBuilder.new(:item, nil, view, {})
  end

  test 'form components render' do
    assert_match 'mdc-text-field', view.material_input(form:, name: 'title', id: 'title')
    assert_match 'mdc-text-field--textarea', view.material_textarea(form:, name: 'body', id: 'body')
    assert_match 'mdc-checkbox', view.material_checkbox(form:, name: 'done', id: 'done')
    assert_match 'mdc-radio', view.material_radio(form:, name: 'kind', id: 'kind', value: 'a')
    assert_match 'mdc-switch', view.material_switch(form:, name: 'on', id: 'on')
    options = [{ value: 'a', label: 'A' }]
    assert_match 'id="kind-label"', view.material_select(form:, name: 'kind', id: 'kind', label: 'Kind', outlined: true, options:)
    assert_match 'id="tags-label"', view.material_chips_input(form:, name: 'tags', id: 'tags', label: 'Tags', url: '/tags')
    assert_match 'mdc-chip-set', view.material_chips_select(form:, name: 'roles', id: 'roles', options: [])
  end

  test 'misc components render' do
    html = view.material_modal(title: 'Hi', id: 'dlg') { 'body' }
    assert_match 'aria-labelledby="dlg-title"', html
    assert_match 'id="dlg-title"', html
    assert_match 'mdc-tooltip', view.material_tooltip(id: 'tip') { 'tip' }
    assert_match 'mdc-chip', view.material_chip(label: 'x')
  end

  test 'input does not force autocomplete off' do
    refute_match 'autocomplete', view.material_input(form:, name: 'title', id: 'title')
  end
end
