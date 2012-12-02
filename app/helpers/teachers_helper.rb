module TeachersHelper
  def gravatar_for(teacher)
    gravatar_id = Digest::MD5::hexdigest(teacher.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: teacher.name, class: "gravatar")
  end
end
