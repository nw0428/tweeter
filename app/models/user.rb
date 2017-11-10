class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy
  has_and_belongs_to_many :following_users,
                          class_name: 'User',
                          join_table: :users_users,
                          foreign_key: :follower_id,
                          association_foreign_key: :followee_id

  has_and_belongs_to_many :followers,
                          class_name: 'User',
                          join_table: :users_users,
                          association_foreign_key: :follower_id,
                          foreign_key: :followee_id
end
