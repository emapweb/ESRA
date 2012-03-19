class ProgramsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def show
  
    #Searching and sorting
    @prog = find_instance
      @events = @prog.events.apply_scopes(
                :search => [params[:search], :event_name],
                :order_by => parse_sort_param(:event_date, :event_name))

    @program = Program.find(params[:id])

    #PDF Generation - most likely replaced by Jasper Reports
    hobo_show do |format|
      format.html
      format.xml { render :xml => @program }
      format.pdf do
        prawnto :prawn => { :top_margin => 72, :left_margin => 72, :right_margin => 72 }
      end
    end
  end

end
