class Api::V1::SessionsController < ApplicationController
	def create
		officer_password = params[:session][:password]
		officer_username = params[:session][:username]
		officer = officer_username.present? && Officer.find_by(username: officer_username)
	
		if officer.valid_password? officer_password
			sign_in officer, store: false
			officer.generate_authentication_token!
			officer.save
			render json: officer, status: 200, location: [:api, officer]
		else
			render json: { errors: "Invalid username or password"}, status: 422
		end
	end

	def destroy
		officer = officer.find_by(auth_token: params[:id])
		officer.generate_authentication_token!
		officer.save
		head 204
	end
end
