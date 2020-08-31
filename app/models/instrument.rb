class Instrument < ApplicationRecord
    has_many :artist_instruments, dependent: :destroy
    has_many :artists, through: :artist_instruments
    validates :name, presence: true
    validates :name, uniqueness: true
end
