class UploadsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :program, [:create, :new]
  auto_actions_for :event, [:create, :new]
  auto_actions_for :disdec, [:create, :new]

  def create_for_disdec
    hobo_create_for :disdec do
      if valid?
        ajax_update_response(params[:page_path], params[:render].values, {}, {:preamble => "<textarea>\nvar _update = Hobo.updateElement;", :postamble => "</textarea>"})
      else
        render(:status => 500,
              :js => "alert(\"#{this.errors.full_messages.join(". ").gsub('\n', '')}\");")
      end
    end
  end

#  def create_for_program
#    hobo_create_for :program do
#      if valid?
#        ajax_update_response(params[:render].values, {}, {:preamble => "<textarea>\nvar _update = Hobo.updateElement;", :postamble => "</textarea>"})
#      else
#        render(:status => 500,
#              :js => "alert(\"#{this.errors.full_messages.join(". ").gsub('\n', '')}\");")
#      end
#    end
#  end

#  def create_for_event
#    hobo_create_for :event do
#      if valid?
#        ajax_update_response(params[:page_path], params[:render].values, {}, {:preamble => "<textarea>\nvar _update = Hobo.updateElement;", :postamble => "</textarea>"})
#      else
#        render(:status => 500,
#              :js => "alert(\"#{this.errors.full_messages.join(". ").gsub('\n', '')}\");")
#      end
#    end
#  end

end
