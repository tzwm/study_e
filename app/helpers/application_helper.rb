module ApplicationHelper
  def include_resources
    "#{include_controller_js}
    #{include_controller_css}
    #{include_action_js}
    #{include_action_css}".html_safe
  end

  def include_controller_js
    if Rails.application.assets.find_asset("#{controller_resource_filename}.js")
      javascript_include_tag controller_resource_filename, 'data-turbolinks-track' => true
    end
  end

  def include_controller_css
    if Rails.application.assets.find_asset("#{controller_resource_filename}.css")
      stylesheet_link_tag controller_resource_filename, media: 'all', 'data-turbolinks-track' => true
    end
  end

  def include_action_js
    if Rails.application.assets.find_asset("#{action_resource_filename}.js")
      javascript_include_tag action_resource_filename, 'data-turbolinks-track' => true
    end
  end

  def include_action_css
    if Rails.application.assets.find_asset("#{action_resource_filename}.css")
      stylesheet_link_tag action_resource_filename, media: 'all', 'data-turbolinks-track' => true
    end
  end

  def action_resource_filename
    @_action_resource_filename ||= "#{controller_name}_#{action_name}"
  end

  def controller_resource_filename
    @_controller_resource_filename ||= controller_name
  end
end
