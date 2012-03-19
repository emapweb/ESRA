class Eeca < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name                :string
    ex_prog             :boolean
    ex_prog_desc        :html
    ex_prog_doc         :string
    test_sae_frequency  :string
    test_epef_frequency :string
    match_hira          :boolean
    ex_eval_proc        :boolean
    eep_desc            :html
    eep_doc             :string
    plans_procs_review  :html
    pp_rev_frequency    :string
    caps_reviewed       :html
    partners            :html
    ca_proc             :boolean
    resolution_desc     :html
    resolution_doc      :string
    timestamps
  end

  belongs_to :program

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
    true
  end

end
