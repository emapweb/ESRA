class Upload < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name  :string, :unique, :required
    timestamps
  end

  belongs_to :event
  belongs_to :program
  belongs_to :disdec
  belongs_to :owner, :class_name => "User", :creator => true

  has_attached_file :proof,
    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_proof_file_name",
    :url => "/system/:attachment/:id/:style/:normalized_proof_file_name"

  Paperclip.interpolates :normalized_proof_file_name do |attachment, style|
    attachment.instance.normalized_proof_file_name
  end

  def normalized_proof_file_name
    "#{self.id}-#{self.proof_file_name.gsub( /[^a-zA-Z0-9_\.]/, '_')}" 
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.signed_up?
  end

  def view_permitted?(field)
    acting_user.signed_up?
  end

end
