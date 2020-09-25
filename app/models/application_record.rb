class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # This is a safety net, in case someone doesn't use the proper serialization in a Controller
  # It's not ideal, but it'll hopefully prevent data leaks from dumb mistakes. Adapted from:
  # https://github.com/jsonapi-serializer/jsonapi-serializer/blob/master/lib/fast_jsonapi/object_serializer.rb
  def as_json(params, serializer: nil)
    if serializer.blank?
      class_name = self.class.name
      serializer_name = "#{class_name.to_s.demodulize.classify}Serializer"
    end

    begin
      serializer ||=  serializer_name.constantize
      serializer.new(self, params: params).serializable_hash
    rescue NameError
      raise NameError, "Cannot resolve a serializer class for '#{class_name}'.  " \
                       "Attempted to find '#{serializer_name}'. " \
                       "Consider specifying the serializer directly through options[:serializer]."
    end
  end

  def to_json(params)
    as_json(params).to_json
  end
end
