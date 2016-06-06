class User < ActiveRecord::Base
  has_many   :resources
  belongs_to :cohort

  def self.omniauth_login(githash)
    user = find_or_create_by(provider: githash["provider"],uid: githash["uid"])
    user.user_name = githash["info"]["nickname"]
    user.email = githash["info"]["email"]
    user.name = githash["info"]["name"]
    user.avatar_url = githash["info"]["image"]
    user.save!
    return user
  end

  def first_name
    name.split(" ").first
  end
end
