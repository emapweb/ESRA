class DisdecsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :program, [:new, :create]

  def edit
    @dd = find_instance
      @ups = @dd.uploads
      @uploads = @dd.uploads.apply_scopes(
                :search => [params[:search], :name],
                :order_by => parse_sort_param(:updated_at, :proof_file_name, :name))

    @disdec = Disdec.find(params[:id])
  end

end
