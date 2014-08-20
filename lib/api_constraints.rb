class ApiConstraints
	def initialize(options)
		@version = options[:version]
		@default = options[:default]
	end

	def matches?(req)
		@defualt || req.headers['Accept'].include?("application/vnd.aaauiucapp.v#{@version}")
	end
end