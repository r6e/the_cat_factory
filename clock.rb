require 'rubygems'
require 'clockwork'

include Clockwork # rubocop:disable Style/MixinUsage

handler do |job|
  # do something
end

every(1.day, 'job_name')
