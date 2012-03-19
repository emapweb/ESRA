class Program < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name                 :string, :required, :unique
    program_jurisdiction :string, :required, :unique
    program_street       :string, :required
    program_city         :string, :required
    program_zip          :string, :required
    program_contact      :string, :required
    contact_title        :string
    contact_phone        :string, :required
    contact_mobile       :string
    contact_email        :string, :required
    continuous_ca_plan   :boolean
    proc_for_devel       :boolean
    ca_tracked           :boolean
    ca_summary           :html
    ca_resolved          :html
    ca_top_1             :string
    ca_top_2             :string
    ca_top_3             :string
    ca_top_4             :string
    ca_top_5             :string
    ca_top_6             :string
    ca_top_7             :string
    ca_top_8             :string
    ca_top_9             :string
    ca_top_10            :string
    timestamps
  end

  # -- Bidnus logic -- #
  belongs_to :owner, :class_name => "User", :creator => true

  belongs_to :program_state, :class_name => "State"

  has_many :events, :dependent => :destroy
  has_many :training_plans, :dependent => :destroy
  has_many :disdecs, :dependent => :destroy
  has_many :hiras, :dependent => :destroy
  has_many :eecas, :dependent => :destroy
  has_many :uploads, :dependent => :destroy

  has_many :reviews, :dependent => :destroy
  has_many :reviewers, :through => :reviews, :source => :users
  has_many :findings, :through => :reviews

  # -- Auto creation of items each program must enter -- #
  after_create :populate

  def populate
    Eeca.create(:name => "Exercises, Evals & CAs", :program_id => id)
    Hira.create(:name => "HIRA", :program_id => id)
    Disdec.create(:name => "Disaster Declarations", :program_id => id)
    Upload.create(:name => "Organizational Chart", :program_id => id)
  end

  # -- Create a URL for generating reports -- #
  def route
    return '/programs/' + id.to_s
  end

  # -- Not really neccessary since these are defined in the view -- #
  children :events, :training_plans, :eecas

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user.program?
  end

  def update_permitted?
    acting_user.administrator? || acting_user.in?(reviewers) || owner_is?(acting_user)
  end

  def destroy_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def view_permitted?(field)
    acting_user.administrator? || acting_user.in?(reviewers) || owner_is?(acting_user)
  end

end
