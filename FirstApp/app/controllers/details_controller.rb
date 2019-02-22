class DetailsController < ApplicationController
  before_action :detail_info, only: [:edit, :update, :show, :destroy]
  def index
		@details = Detail.all
  end

	def show
		@detail = Detail.find(params[:id])
	end

	def new
		@detail = Detail.new
	end

	def edit
	
	end

	def create
		@detail = Detail.create(detail_params)
		if @detail.save
			redirect_to details_path
		else
			render 'index'
		end
  end

	def update
		  
			if @details.update(detail_params)
				flash[:success] = "Object was successfully updated"
				redirect_to @details
			else
				flash[:error] = "Something went wrong"
				render 'edit'
			end
	end

	def destroy
		
		if @details.destroy
			flash[:success] = 'Object was successfully deleted.'
			redirect_to details_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to details_path
		end
	end
	
	private 

	def detail_params
		params.require(:detail).permit(:Name, :Age, :Email)
	end

	def detail_info
		@details = Detail.find_by(id: params[:id])
	end

end
