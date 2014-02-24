class Patient < ActiveRecord::Base
belongs_to :doctor
has_many :appointments
has_many :prescription

end
