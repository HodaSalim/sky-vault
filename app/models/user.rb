class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }

  has_many :workspaces, foreign_key: "owner_id"

  after_create :create_default_workspace

  private

  def create_default_workspace
    self.workspaces.create(is_shared: false, created_at: Time.current)
  end
end
