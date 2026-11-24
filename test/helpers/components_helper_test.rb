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

  test 'menu button and modal render their partial when no block is given' do
    assert_match 'My Profile', view.material_menu_button(button_text: 'Menu', menu_contents_partial: 'common/menu_contents')
    assert_match 'My Profile', view.material_modal(title: 'Hi', id: 'dlg', contents_partial: 'common/menu_contents')
  end

  test 'chips input accepts selected chips keyed by value and a blank value' do
    html = view.material_chips_input(form:, name: 'to', id: 'to', url: '/r', value: '',
                                     selected: [{ value: 3, label: 'Ann' }])
    assert_match 'data-value="3"', html
    assert_match(/type="hidden"[^>]*value="3"|value="3"[^>]*type="hidden"/, html)
  end

  test 'data table uses the host per_page_options helper when present' do
    view.define_singleton_method(:per_page_options) { [{ value: 7, label: 'seven' }] }
    require Rails.root.join('../../lib/lookbook/data_table_preview').to_s
    pagy = DataTablePreview::Pagy.new(page: 1, limit: 7, count: 3)
    html = view.material_data_table(name: 'T', table_body: 'b', url: '/t', table_params: {}, records: [],
                                    selected_records: [], pagy:, table_headers_partial: 'lookbook/data_table_headers',
                                    table_contents_partial: 'lookbook/data_table_rows')
    assert_match 'data-value="7"', html
    refute_match 'data-value="25"', html
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
