require 'rails_helper'

RSpec.describe LibrariesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/catalogue').to route_to('libraries#index')
    end
  end
end
