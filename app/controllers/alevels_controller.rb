class AlevelsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  autocomplete :name, :query_scope => [:name_contains]

end
