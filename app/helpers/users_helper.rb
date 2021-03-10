module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # if gravatar_id.blank?
      gravatar_url = "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=https://cdn1.vectorstock.com/i/thumb-large/82/55/anonymous-user-circle-icon-vector-18958255.jpg"
    # else
    #   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    # end

    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
