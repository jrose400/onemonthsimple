class BenefitFormsController < ApplicationController

  def index
    @benefits = Benefits.new
  end

  def download
   begin
     file = params[:name]
     send_file file, :disposition => 'attachment'
   rescue
     redirect_to user_benefit_forms_path(:user_id => current_user.user_id)
   end
  end

  def upload
    file = params[:benefits][:upload]
    if file
      flash[:success] = "File Successfully Uploaded!"
      Benefits.save(file, params[:benefits][:backup])
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to user_benefit_forms_path(:user_id => current_user.user_id)
  end
end
