class RegistrationsController < Devise::RegistrationsController

	def new
		super
	end

	def create
		super
		if params[:user][:quote_id].present?
			quote = Quote.find_by_id(params[:user][:quote_id])
			quote.user_id = current_user.id
			quote.save
		end
	end

	def update
		super
	end

	def edit
		super
	end

	def destroy
		super
	end


def after_sign_up_path_for(resource)
	if params[:user][:quote_id].present? 
		quote_url(params[:user][:quote_id])
	else 
		super
	end
end 


def after_sign_in_path_for(resource)
	if params[:user][:quote_id].present? 
		quote_url(params[:user][:quote_id])
		quote = Quote.find_by_id(params[:user][:quote_id])
		quote.user_id = current_user.id
		quote.save		
	else 
		super
	end
end 

end
