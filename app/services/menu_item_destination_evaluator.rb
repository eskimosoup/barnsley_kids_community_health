class MenuItemDestinationEvaluator

  attr_reader :menu_resource, :menu_name

  def initialize(view_template:, menu_resource:, admin: false, menu_name:)
    @view_template = view_template
    @menu_resource = menu_resource
    @admin = admin
    @menu_name = menu_name
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
      when Service
        base_url
        #h.request.protocol + menu_resource.subdomain + "." + [h.request.domain, h.request.port].compact.join(":")
      else
    end
  end

  def active?
    h.current_page?(destination)
  end

  private

  def module_page_route
    if admin?
      base_url + h.main_app.public_send(menu_resource.route) if h.main_app.respond_to?(menu_resource.route)
    else
      base_url + h.public_send(menu_resource.route) if h.respond_to?(menu_resource.route)
    end
  end

  def page_route
    if menu_resource.service.nil? || menu_resource.service_subdomain == h.request.subdomain
      base_url + h.page_path(menu_resource)
    else
      nil
    end
  end

  def h
    @view_template
  end

  def base_url
    [protocol, subdomain, ".", domain, port].compact.join
  end

  def protocol
    h.request.protocol
  end

  def subdomain
    if menu_resource.instance_of?(Service) || menu_name != "header"
      menu_resource.subdomain
    else
      "www"
    end
  end

  def domain
    h.request.domain
  end

  def port
    ":#{ h.request.port }" if h.request.port
  end

end
