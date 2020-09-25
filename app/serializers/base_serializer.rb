class BaseSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  class << self
    delegate :url_helpers, to: 'Rails.application.routes'
  end
end
