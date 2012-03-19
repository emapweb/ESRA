class Event < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    event_name                 :string, :required, :unique, :name => true
    event_contact              :string
    event_date                 :date
    event_end_date             :date
    event_duration             :string, :required
    event_duration_description :html
    event_scenario_summary     :html
    statewide_event            :boolean
    multistate_event           :boolean
    dhs_funded                 :boolean
    ema_role                   :html
    timestamps
  end

  belongs_to :owner, :class_name => "User", :creator => true

  belongs_to :program
  belongs_to :event_state, :class_name => "State"
  belongs_to :event_type, :class_name => "Etype"
  belongs_to :event_scenario, :class_name => "Escenario"

  has_many :eparticipants, :dependent => :destroy, :accessible => true
  has_many :e_open_cas, :dependent => :destroy, :accessible => true
  has_many :ehosts, :dependent => :destroy, :accessible => true
  has_many :egoals, :dependent => :destroy, :accessible => true
  has_many :elocations, :dependent => :destroy, :accessible => true
  has_many :efundings, :dependent => :destroy, :accessible => true

  has_many :tcls, :dependent => :destroy

  has_many :learned_lessons, :dependent => :destroy
  has_many :uploads, :dependent => :destroy
  has_many :tcls, :dependent => :destroy

  children :tcls, :learned_lessons, :uploads

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    acting_user.signed_up?
  end

end
