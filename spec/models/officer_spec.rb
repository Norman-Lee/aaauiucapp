require 'rails_helper'

describe Officer do
	before { @officer = FactoryGirl.build(:officer) }

	subject { @officer }

	it { should respond_to(:username) }
	it { should respond_to(:salted_password) }
	it { should respond_to(:start_date)}
	it { should respond_to(:end_date)}
	it { should respond_to(:auth_token)}

	describe '#generate_authentication_token!' do
		it "generates a unqiue token" do
			Devise.stub(:friendly_token).and_return("auniquetoken123")
			@officer.generate_authentication_token!
			expect(@officer.auth_token).to eql "auniquetoken123"
		end

		it "generates another token when one already has been taken" do
			existing_officer = FactoryGirl.create(:officer, auth_token: "auniquetoken123")
			@officer.generate_authentication_token!
			expect(@officer.auth_token).not_to eql existing_officer.auth_token
		end
	end
end
