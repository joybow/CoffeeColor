class Post < ApplicationRecord
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  has_many_attached :post_images
  has_many :comments, dependent: :destroy
  # 通知機能
  has_many :notifications, dependent: :destroy
  validates :title, :content, presence: true
  attr_accessor :image_blob_id

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(search, word, *columns)
    if search == "forward_match"
      conditions = columns.map{|column| "#{column} LIKE ?"}.join(" OR ")
      conditions_params = Array.new(columns.size, "#{word}%")
      @posts = Post.where(conditions, *conditions_params)
    elsif search == "backward_match"
      conditions = columns.map{|column| "#{column} LIKE ?"}.join(" OR ")
      conditions_params = Array.new(columns.size, "%#{word}")
      @posts = Post.where(conditions, *conditions_params)
    elsif search == "partial_match"
      conditions = columns.map{|column| "#{column} LIKE ?"}.join(" OR ")
      conditions_params = Array.new(columns.size, "%#{word}%")
      @posts = Post.where(conditions, *conditions_params)
    else
      @posts = Post.all
    end
  end
  
  
  def self.ransackable_attributes(auth_object = nil)
    auth_object ? super : %w(content title)
  end

  def self.ransackable_associations(auth_object = nil)
    auth_object ? super : %w[name]
  end

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  

end
