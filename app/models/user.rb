class User < ApplicationRecord
  extend SwitchFlg
  extend DisplayList

  enum is_roaster: { customer: 0, roaster: 1, maker: 2 }

  enum local:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
    沖縄県:47,海外:48
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :posts_favorites, through: :favorites,  source: :post, dependent: :destroy

  has_one_attached :user_image, service: :amazon
  has_many :tasks, dependent: :destroy
  validates :user_image, content_type: { in: %w[image/jpeg image/gif image/png],
                          message: "有効なフォーマットではありません"},
                          size: { less_than: 5.megabytes, message: "5MBを超える画像はアップロードできません"}
  has_many :comments, dependent: :destroy
  # フォロー機能
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧で使用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  # チャット機能
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  # チャットメッセージ機能
  has_many :chat_messages
  
  scope :search_information, -> (keyword) {
    where("name like ?","%#{keyword}%").
    or(where("email like ?","%#{keyword}%")).
    or(where("address like ?","%#{keyword}%")).
    or(where("local like ?","%#{keyword}%")).
    or(where("phone like ?","%#{keyword}%")).
    or(where("id ?", "%#{keyword}%"))
  }
  def self.ransackable_attributes(auth_object = nil)
    auth_object ? super : %w(name is_roaster )
  end
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validate :password_match, if: :password_required?

  def update_without_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    if params[:email].present? && params[:email] != self.email
      self.unconfirmed_email = params[:email]
      self.skip_reconfirmation!
      params.delete(:email) if params[:user].present?
    end
    result = update(params, *options)
    unless result
      Rails.logger.debug "Update failed: #{errors.full_messages.join(',')}"
    end
    clean_up_passwords
    result
  end

  def self.ransackable_associations(auth_object = nil)
    auth_object ? super : %w[ ]
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def followings?(user)
    followings.include?(user)
  end
  
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  def self.user_name_profile(user)
    { name: user.name.to_s, is_roaster: user.is_roaster.to_s}
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      password = SecureRandom.urlsafe_base64
      user.password = password
      user.password_confirmation = password
      user.name = "ゲスト"
      user.postal_code = "1234567"  
      user.address = "ゲストアドレス"  
      user.phone = "1234567890"  
      user.is_roaster = 0  
      user.local = 0 
    end
  end

  private

  def password_required?
    new_record? || !password.nil?
  end

  def password_match
    errors.add(:password_confirmation, "とパスワードの入力が一致しません") if password != password_confirmation
  end

end
