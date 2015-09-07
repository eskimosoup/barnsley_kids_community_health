class MenuItemDestinationEvaluator

  attr_reader :menu_resource

  def initialize(view_template:, menu_resource:, admin: false)
    @view_template = view_template
    @menu_resource = menu_resource
    @admin = admin
  end

  def admin?
    @admin
  end

  def destination
    case menu_resource
      when Optimadmin::ModulePage
        module_page_route
      when Optimadmin::ExternalLink
        menu_resource.name
      when Page
        page_route
      else
        menu_resource
    end
  end

  def active?
    h.current_page?(destination)
  end

  private

  def module_page_route
    if admin?
      h.main_app.public_send(menu_resource.route) if h.main_app.respond_to?(menu_resource.route)
    else
      h.public_send(menu_resource.route) if h.respond_to?(menu_resource.route)
    end
  end

  def page_route
    if menu_resource.service.nil? || menu_resource.service_subdomain == h.request.subdomain
      menu_resource
    else
      nil
    end
  end

  def h
    @view_template
  end

end
