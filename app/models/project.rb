class Project < ApplicationRecord
    has_many :groups
    has_many :user, through: :groups
    has_many :topic
    has_many_attached :files
end