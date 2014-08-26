require 'rails_helper'

RSpec.describe Api::V1::MembersController, :type => :controller do
	describe "GET #show" do
		before(:each) do
			@member = FactoryGirl.create :member
			get :show, id: @member.id
		end

		it {should respond_with 200}
	end

	describe "POST #create" do
		context "when is successfully created" do
			before(:each) do
				@member_attributes = FactoryGirl.attributes_for :member
				post :create, {member: @member_attributes}
			end

			it "renders the json representation for member record just created" do
				member_response = json_response
				expect(member_response[:e_mail]). to eql @member_attributes[:email]
			end

			it{ should respond_with 201}
		end

		context "when not successfully created" do
			before(:each) do
				@invalid_member_attributes = { e_mail: 'wtf@com' }
				post :create, { member: @invalid_event_attributes }
			end

			it "renders an error in json" do
				member_response = json_response
				expect(member_response).to have_key(:errors)
			end

			it "tells why the member record could not be created in json" do
				member_response = json_response
				expect(event_response[:errors][:e_mail]).to include "is invalid"
			end

			it {should respond_with 422}
		end
	end
	
	describe "PUT/PATCH #update" do
		context "when successfully updated" do
			before(:each) do
				@member = FactoryGirl.create :member
				patch :update, { id: @member.id, member: {e_mail: "yoloswaq420@gmail.com"}}
			end

			it "renders the json represntation for the updated user" do
				member_response = json_response
				expect(member_response[:e_mail]).to eql "yoloswaq420@gmail.com"
			end

			it {should respond_with 200}
		end
	end

	describe "DELETE #destroy" do
		before(:each) do
			@member = FactoryGirl.create :member
			delete :destroy, {id: @member.id}
		end

		it { should respond_with 204 }
	end
end