module ApplicationHelper
  def order_params(field_name, order, order_dir, default_order = "asc")
    order_params = {}
    order_params[:order] = field_name
    if (order == field_name)
      order_params[:order_dir] = (order_dir == "asc" ? "desc" : "asc")
    else
      order_params[:order_dir] = default_order
    end
    params.permit!.merge(order_params)
  end
end
