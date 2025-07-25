require "application_system_test_case"

class WidgetsTest < ApplicationSystemTestCase
  setup do
    @widget = widgets(:one)
  end

  test "visiting the index" do
    visit widgets_url
    assert_selector "h1", text: "Widgets"
  end

  test "should create widget" do
    visit widgets_url
    click_on "New widget"

    fill_in "Cost", with: @widget.cost
    fill_in "Name", with: @widget.name
    fill_in "Size", with: @widget.size
    fill_in "Stock", with: @widget.stock
    check "Toxic" if @widget.toxic
    click_on "Create Widget"

    assert_text "Widget was successfully created"
    click_on "Back"
  end

  test "should update Widget" do
    visit widget_url(@widget)
    click_on "Edit this widget", match: :first

    fill_in "Cost", with: @widget.cost
    fill_in "Name", with: @widget.name
    fill_in "Size", with: @widget.size
    fill_in "Stock", with: @widget.stock
    check "Toxic" if @widget.toxic
    click_on "Update Widget"

    assert_text "Widget was successfully updated"
    click_on "Back"
  end

  test "should destroy Widget" do
    visit widget_url(@widget)
    accept_confirm { click_on "Destroy this widget", match: :first }

    assert_text "Widget was successfully destroyed"
  end
end
