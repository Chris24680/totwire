class WidgetsController < ApplicationController
  include Pagy::Backend

  # GET /widgets or /widgets.json
  def index
    widgets = Widget.all.includes(:inventor)
    widgets = Widget::FILTER.call(widgets, params)
    widgets = widgets.order(sort)

    @pagy, @widgets = pagy(widgets, limit: 10)
  end

  private

  def sort
    column = Widget::SORT_COLUMNS.map { |x| x[:sort_column] }.include?(params[:sort_column]) ? params[:sort_column] : Widget::SORT_COLUMNS[0][:sort_column]
    order = %w[asc desc].include?(params[:sort_direction]) ? params[:sort_direction] : "asc"

    {column => order}
  end
end
