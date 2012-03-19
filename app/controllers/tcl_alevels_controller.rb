class TclAlevelsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  def new
    hobo_new do
      this.attributes = params[:tcl_alevel] || {}
      hobo_ajax_response if request.xhr?
    end
  end

  def edit
    hobo_show do
      this.attributes = params[:tcl_alevel] || {}
      hobo_ajax_response if request.xhr?
    end
  end

end
