class Api::V1::MembersController < ApplicationController
	respond_to :json

	def show
		respond_with Member.find(params[:id])
	end

	def create
		member = Member.new(member_params)
		if member.save
			render json: member, status: 201, location: [:api, member]
		else
			render json: {errors: member.errors}, status: 422
		end
	end

	def update
		member = Member.find(params[:id])

		if member.update(member_params)
			render json: member, status: 200, location: [:api, member]
		else
			render json: { errors: member.errors }, status: 422
		end
	end

	def destroy
		member = Member.find(params[:id])
		member.destroy
		head 204
	end

	private
		def member_params
			params.require(:member).permit(:first_name, :last_name, :class_standing, :sex, :e_mail, :attendance_level)
		end
end