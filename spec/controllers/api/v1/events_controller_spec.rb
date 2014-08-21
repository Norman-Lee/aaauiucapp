require 'rails_helper'

RSpec.describe Api::V1::EventsController, :type => :controller do
	before(:each) { request.headers['Accept'] = 'application/vnd.aaauiucapi.v1'}

	describe 'GET #show' do
		before(:each) do
			@event = FactoryGirl.create :event
			get :show, id: @event.id, format: :json
		end

	it { should respond_with 200 }
	end
end
