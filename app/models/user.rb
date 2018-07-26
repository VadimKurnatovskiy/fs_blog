class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable

  validates_presence_of :first_name

  before_create :set_default_role

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def admin
    role? :admin
  end

  def name
    "#{first_name || 'Anonymous'} #{last_name}"
  end

  def first_name
    self[:first_name] || "Anonymous"
  end

  def to_s
    name
  end

  def add_role(role)
    unless role? role
      self.roles << Role.where(name: role.to_s).first_or_create
    end
  end
  def created_at_h
    created_at.strftime("%d/%m/%Y %H:%M")
  end

  private

  def set_default_role
    unless role? 'admin'
      self.roles << Role.where(name: 'admin').first_or_create
    end
  end

end
