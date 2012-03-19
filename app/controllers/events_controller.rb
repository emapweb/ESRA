class EventsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :program, [:new, :create]

end
