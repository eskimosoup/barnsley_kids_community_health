module Optimadmin
  module PresenterHelper
    def nested_admin_menu_items(menu_items:, depth: 1, menu_name:)
      menu_items.map do |menu_item, sub_menu_items|
        render partial: "optimadmin/menu_items/menu_item",
               locals: { menu_item_presenter: Optimadmin::MenuItemPresenter.new(object: menu_item, view_template: self, menu_name: menu_name),
                         sub_menu_items: sub_menu_items, depth: depth, menu_name: menu_name }
      end.join.html_safe
    end
  end
end