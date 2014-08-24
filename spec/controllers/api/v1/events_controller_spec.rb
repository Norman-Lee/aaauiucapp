require 'rails_helper'

RSpec.describe Api::V1::EventsController, :type => :controller do
	before(:each) { request.headers['Accept'] = "application/vnd.aaauiucapi.v1, #{Mime::JSON}"}

	before(:each) { request.headers['Content-Type'] = Mime::JSON.to_s }

	describe 'GET #show' do
		before(:each) do
			@event = FactoryGirl.create :event
			get :show, id: @event.id
		end

		it { should respond_with 200 }
	end

	describe 'POST #create' do
		context "when is successfully created" do
			before(:each) do
				@event_attributes = FactoryGirl.attributes_for :event
				post :create, { event: @event_attributes }
			end

			it "renders the json representation for the event record just created" do
				event_response = json_response
				expect(event_response[:name]). to eql @event_attributes[:name]
			end

			it {should respond_with 201}
		end

		context "when is not created" do
			before(:each) do
				@invalid_event_attributes = { location: 'Ham Sup Lo Park' }
				post :create, { event: @invalid_event_attributes }
			end

			it "renders an error in json" do
				event_response = json_response
				expect(event_response).to have_key(:errors)
			end

			it "tells why the event could not be created in json" do
				event_response = json_response
				expect(event_response[:errors][:name]).to include "can't be blank"
			end

			it { should respond_with 422 }
		end
	end

	describe "PUT/PATCH #update" do
		context "when successfully updated" do
			before(:each) do
				@event = FactoryGirl.create :event
				patch :update, { id: @event.id, event: {location: 'Dat new park'}}
			end 

			it "renders the json representation for the updated user" do
				event_response = json_response
				expect(event_response[:location]).to eql 'Dat new park'
			end

			it { should respond_with 200 }	
		end	
	end

	describe "DELETE #destroy" do
		before(:each) do
			@event = FactoryGirl.create :event
			delete :destroy, {id: @event.id}
		end

		it { should respond_with 204 }
	end		
end
