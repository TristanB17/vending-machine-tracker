class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
end
