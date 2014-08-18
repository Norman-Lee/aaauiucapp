class WelcomeController < ApplicationController
  def index
    @member_info = Member.all
    @Officer_info = Officer.all
  end
end
