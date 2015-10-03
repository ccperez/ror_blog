class WelcomeController < ApplicationController
	def index
		@posts = Post.limit(3).order("created_at desc")
		@projects = Project.limit(3).order("created_at desc")
	end
end
