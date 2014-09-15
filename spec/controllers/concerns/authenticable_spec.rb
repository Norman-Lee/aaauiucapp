require 'rails_helper'

class Authentication
	include Authenticable
end

describe Authenticable do
	let (:authentication) { Authentication.new }

	describe '#current_officer' do
		before do
			@officer = FactoryGirl.create :officer
			request.headers["Authorization"] = @officer.auth_token
			authentication.stub(:request).and_return(request)
		end

		it "returns the officer from the authorization header" do
			expect(authentication.current_user.auth_token).to eql @officer.auth_token
		end
	end
end