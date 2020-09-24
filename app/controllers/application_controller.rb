class ApplicationController < ActionController::Base
  # Use assets from frontend/ since the default app/javascript doesn't make sense for our setup
  prepend_view_path Rails.root.join('frontend')
  # Always render our base React page, and let React handle routing unless otherwise specified
  rescue_from ActionController::MissingExactTemplate, with: :render_react

  def render_react
    render 'layouts/application'
  end
end
