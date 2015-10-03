class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.

	protect_from_forgery with: :exception

	def get_object( id, object )
		id ? object.friendly.find(id) : object.new

		rescue ActiveRecord::RecordNotFound
			redirect_to(root_url, :notice => 'Record not found')
	end
end
