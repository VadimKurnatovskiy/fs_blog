class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates_presence_of :first_name

  before_create :set_default_role

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
    user = User.create(first_name: access_token.extra.raw_info.first_name,
                     provider: access_token.provider,
                     uid: access_token.uid,
                     email: access_token.info.email,
                     password:Devise.friendly_token[0,20]
                     )
    end
    user
  end

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
