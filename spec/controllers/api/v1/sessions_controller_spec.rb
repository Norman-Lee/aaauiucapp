require 'rails_helper'

RSpec.describe Api::V1::SessionsController, :type => :controller do
	describe "POST #create" do
		before(:each) do
			@officer = FactoryGirl.create :officer
		end

		context "when the credentials are correct" do
			before(:each) do
				credentials = { username: @officer.username, password: "12345678"}
				post :create, { session: credentials }
			end

			it "returns the officer record corresponding to the given credentials" do
				@officer.reload
				expect(json_response[:auth_token]).to eql @officer.auth_token
			end

			it { should respond_with 200 }
		end

		context "when the credentials are incorrect" do
			before(:each) do
				credentials = { username: @officer.username, password: "invalidpassword"}
				post :create, { session: credentials }
			end

			it "returns a json with an error" do
				expect(json_response[:errors]).to eql "Invalid username or password"
			end

			it { should respond_with 422 }
		end
	end

	describe "DELETE #destroy" do
		before(:each) do
			@officer = FactoryGirl.create :officer
			sign_in @officer, store: false
			delete :destroy
		end

		it { should respond_with 204 }
	end
end
