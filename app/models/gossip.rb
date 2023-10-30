class Gossip < ApplicationRecord
  has_many :tags, through: :gossip_tags
  has_many :comments
  belongs_to :user
end
