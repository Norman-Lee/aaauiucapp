module Authenticable
	def current_user
		@current_officer ||= Officer.find_by(auth_token: request.headers['Authorization'])
	end
end