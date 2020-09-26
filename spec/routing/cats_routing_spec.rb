require 'rails_helper'

RSpec.describe CatsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cats').to route_to('cats#index')
    end

    it 'routes to #upvote' do
      expect(post: '/cats/1/upvote').to route_to('cats#upvote', id: '1')
    end

    it 'routes to #downvote' do
      expect(post: '/cats/1/downvote').to route_to('cats#downvote', id: '1')
    end
  end
end
