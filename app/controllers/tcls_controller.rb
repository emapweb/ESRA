class TclsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :event, [:new, :create]

  def show

    #Searching and sorting
    @tc = find_instance
      @corrective_actions = @tc.corrective_actions.apply_scopes(
                :order_by => parse_sort_param(:name, :assigned_to, :completed_date, :completed_by))

    @tcl = Tcl.find(params[:id])
  end

  def new
    hobo_new do
      this.attributes = params[:tcl] || {}
      hobo_ajax_response if request.xhr?
    end
  end

  def edit
    hobo_show do
      this.attributes = params[:tcl] || {}
      hobo_ajax_response if request.xhr?
    end
  end

end
