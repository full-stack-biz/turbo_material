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

  test 'chips input renders selected chips with values in the hidden field' do
    html = view.material_chips_input(form:, name: 'tags', id: 'tags', url: '/tags',
                                     selected: [{ id: 7, label: 'Seven' }, { id: 9, label: 'Nine' }])
    assert_match 'data-value="7"', html
    assert_match(/type="hidden"[^>]*value="7,9"|value="7,9"[^>]*type="hidden"/, html)
  end

  test 'switch uses the given id' do
    html = view.material_switch(form:, name: 'on', id: 'notify', label: 'Notify')
    assert_match 'id="notify"', html
    assert_match 'for="notify"', html
  end

  test 'radio renders custom options and checks the current value' do
    html = view.material_radio(form:, name: 'size', id: 'size', value: 'm',
                               options: [{ value: 's', label: 'Small' }, { value: 'm', label: 'Medium' }])
    assert_match 'Medium', html
    assert_match(/value="m"[^>]*checked|checked[^>]*value="m"/, html)
    refute_match(/value="s"[^>]*checked|checked[^>]*value="s"/, html)
    assert_equal 2, html.scan('data-controller="material-radio"').size
  end

  test 'radio defaults to Yes/No with blank value as No' do
    html = view.material_radio(form:, name: 'ok', id: 'ok')
    assert_match(/value="false"[^>]*checked|checked[^>]*value="false"/, html)
  end

  test 'input does not force autocomplete off' do
    refute_match 'autocomplete', view.material_input(form:, name: 'title', id: 'title')
  end
end
