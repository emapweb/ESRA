class Alevel < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name     :string
    tcap_id  :integer
    timestamps
  end

  belongs_to :tcap
  has_many :tcls

  #def self.find_by_name(name)
  #  names = name.split(' ')
  #  (0..(names.length-2)).inject(nil) do |result, n|
  #    result ||= self.find_by_name(names[0..n].join(' '), names[1..(n+1)].join(' '))
  #  end
  #end

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
