class Admin::SettingsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    p "params ~~~> #{params.inspect}"
    @user = User.find(params[:user][:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_edit_settings_path, notice: 'Blog settings was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
