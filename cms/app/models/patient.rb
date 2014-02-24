class Patient < ActiveRecord::Base
has_many :doctor, :through => :appointments
has_many :appointments
has_many :prescription

end
