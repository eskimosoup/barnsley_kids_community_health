module Optimadmin
  class MenuItemPresenter < BasePresenter
    presents :menu_item
    extend Forwardable
    def_delegators :menu_item, :name
    attr_reader :link, :menu_resource, :menu_name

    def initialize(object:, view_template:, menu_name:)
      super(object: object, view_template: view_template)
      @link = menu_item.link
      @menu_resource = @link.menu_resource
      @menu_name =  menu_name
    end

    def named_edit_link
      edit_link(content: name)
    end

    def octicon_edit_link
      edit_link(content: pencil, options: { class: 'menu-item-control' })
    end

    def delete_link
      if menu_item.deletable?
        h.link_to trash_can, h.menu_item_path(menu_item), method: :delete, data: { confirm: 'Are you sure?' }, class: 'menu-item-control'
      else
        disabled_delete_link
      end
    end

    def show_link
      if menu_item.nil?
        disabled_show_link
      else
        h.link_to eye, destination, title: link.menu_resource_type, class: 'menu-item-control', target: '_blank'
      end
    end

    def menu_resource_type
      if menu_resource.present?
        menu_resource.class.name
        .gsub('Optimadmin::', '')
        .gsub(/[a-zA-Z](?=[A-Z])/, '\0 ').downcase.humanize
      elsif menu_resource.nil? && menu_item.children.present?
        "Drop down menu item"
      elsif menu_resource.nil? && menu_item.leaf?
        h.content_tag :span, class: "dead-link" do
          "Dead link"
        end
      end
    end

    def menu_resource_name
      "'#{menu_resource.try(:name) || menu_resource.try(:title) || menu_resource.try(:headline)}'" unless menu_resource.nil?
    end

    private

    def edit_link(content:, options: {})
      h.link_to content, h.edit_menu_item_path(menu_item), options
    end

    def destination
      destination_evaluator.destination
    end

    def destination_evaluator
      @destination_evaluator ||= MenuItemDestinationEvaluator.new(view_template: h, menu_resource: menu_resource, admin: true, menu_name: menu_name)
    end
  end
end
