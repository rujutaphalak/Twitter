module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    #gravatar_url = "https://gn.wikipedia.org/wiki/Twitter#/media/File:Twitter_Logo_Mini.svg/#{gravatar-id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
