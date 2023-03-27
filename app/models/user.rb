class User < ApplicationRecord
    has_many :quize_datas
    validates :email, presence: true
    validates :password, presence: true
end
