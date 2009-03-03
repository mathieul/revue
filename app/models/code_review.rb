class CodeReview < ActiveRecord::Base
  include AASM

  belongs_to :owner, :class_name => "User"
  
  named_scope :active, :conditions => {:state => 'active'}

  validates_presence_of :title
  validates_length_of :title, :maximum => 200
  validates_presence_of :owner_id

  aasm_column :state
  aasm_initial_state :initial => :active
  aasm_state :passive
  aasm_state :active
  aasm_state :done

  aasm_event :finish do
    transitions :from => :active, :to => :done
  end
end
