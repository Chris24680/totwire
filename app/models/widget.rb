class Widget < ApplicationRecord
  belongs_to :inventor

  SORT_COLUMNS = [
    {label: "ID", sort_column: "id"},
    {label: "Name", sort_column: "name"},
    {label: "Cost", sort_column: "cost"},
    {label: "Stock", sort_column: "stock"},
    {label: "Size", sort_column: "size"},
    {label: "Toxic", sort_column: "toxic"},
    {label: "Inventor", sort_column: "inventors.name"}
  ]

  FILTER = proc do |widgets, params|
    widgets = widgets.where(size: params[:size]) if params[:size].present?
    widgets = widgets.where(cost: (params[:cost_min])..) if params[:cost_min].present?
    widgets = widgets.where(cost: (..params[:cost_max])) if params[:cost_max].present?
    widgets = widgets.where(created_at: (params[:created_at_start]..)) if params[:created_at_start].present?
    widgets = widgets.where(created_at: (..params[:created_at_end])) if params[:created_at_end].present?
    widgets
  end
end
