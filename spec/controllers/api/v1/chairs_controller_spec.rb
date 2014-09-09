require 'rails helper'

RSpec.describe Api::V1:ChairsController, :type => :controller do 
	describe 'GET #show' do
		before(:each) do	
			@chair = FactoryGirl.create :chair
			get :show, id: @chair.id
		end

	it {should respond_with 200}
	
	end
	
	describe 'POST #create' do
		context "when is successfully created" do
			before(:each) do
				@chair_attributes = FactoryGirl.attrbutes_for :chair
				post :create, { chair: @chair_attributes }
			end

			it "renders the json representation for the chair record just created" do
				chair_response = json_response
				expect(event_response[]). to eql @chair_attributes[]
			end

		end
	end	
end