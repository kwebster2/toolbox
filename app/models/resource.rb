class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many   :resources_tags
  has_many   :tags, through: :resources_tags
  has_many   :bookmarks

  validates :name, presence: true
  validates :url, presence: true

  def add_bookmark(user)
    user_bookmarked?(user) ? unbookmark(user) : bookmark(user)
  end

  def bookmarks_count(user)
    if bookmarks.count == 1
      "#{bookmarks.count} save".html_safe
    else
      "#{bookmarks.count} saves".html_safe
    end
  end

  def save_text(user)
    if user_bookmarked?(user)
      "Saved"
    else
      "Save"
    end
  end

  def star_class(user)
    if user_bookmarked?(user)
      "glyphicon glyphicon-star"
    else
      "glyphicon glyphicon-star-empty"
    end
  end

  def short_description
    if description.nil?
      return
    elsif description.length > 100
      return description[0..99]+"..."
    else
      return description
    end
  end

  private
  def user_bookmarked?(user)
    bookmarks.where(user: user).any?
  end

  def bookmark(user)
    bookmarks.create(user_id: user.id)
  end

  def unbookmark(user)
    bookmarks.find_by(user_id: user.id).destroy
  end
end
