class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name            :string, :required
#    username        :string, :required, :unique
    email_address   :email_address, :login => true
    agency          :string
    job_title       :string
    administrator   :boolean, :default => false
    reviewer        :boolean, :default => false
    program         :boolean, :default => false
    timestamps
  end

  scope :administrators, :conditions => { :administrator => true }

  has_many :review_assignments, :dependent => :destroy
  has_many :reviews, :through => :review_assignments

  def self.find_by_name(name)
    names = name.split(' ')
    (0..(names.length-2)).inject(nil) do |result, n|
      result ||= self.find_by_name_and_username(names[0..n].join(' '), names[1..(n+1)].join(' '))
    end
  end

  # This gives admin rights and an :active state to the first sign-up.
  # Just remove it if you don't want that
  before_create do |user|
    if !Rails.env.test? && user.class.count == 0
      user.administrator = true
      user.state = "active"
    end
  end

  def new_password_required_with_invite_only?
    new_password_required_without_invite_only? || self.class.count==0
  end
  alias_method_chain :new_password_required?, :invite_only

  # --- Signup lifecycle --- #

  lifecycle do

    state :invited, :default => true
    state :active
    state :disabled

    create :invite,
           :available_to => "acting_user if acting_user.administrator?",
           :subsite => "admin",
           :params => [:name, :email_address, :agency, :job_title],
           :new_key => true,
           :become => :invited do
       UserMailer.invite(self, lifecycle.key).deliver
    end

    transition :accept_invitation, { :invited => :active }, :available_to => :key_holder,
               :params => [ :password, :password_confirmation ] # [ :username, :password, :password_confirmation ]

    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.forgot_password(self, lifecycle.key).deliver
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder,
               :params => [ :password, :password_confirmation ]

    transition :disable_account, { :active => :disabled }, :available_to => "acting_user if acting_user.administrator?",
               :subsite => "admin",
               :params => [:name],
               :new_key => true,
               :become => :disabled

    transition :enable_account, { :disabled => :active }, :available_to => "acting_user if acting_user.administrator?",
               :subsite => "admin",
               :params => [:name],
               :new_key => true,
               :become => :active

  end

  def signed_up?
    state=="active"
  end

  def blocked?
    state=="disabled"
  end

  # --- Auto-generation of assigned reviews for reviewers only--- #  

  children :reviews # conditionally rendered in view

  # --- Permissions --- #

  def create_permitted?
    # Only the initial admin user can be created
    self.class.count == 0
  end

  def update_permitted?
    acting_user.administrator? ||
      (acting_user == self && only_changed?(:email_address, :username, :agency, :job_title, :crypted_password,
                                            :current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end
end
