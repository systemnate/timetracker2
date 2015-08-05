# Users Helper
module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name,
                            class: 'gravatar img-circle', size: '25x25')
  end

  def gravatar_email(contact)
    if contact.email.blank?
      gravatar_url = "https://secure.gravatar.com/avatar/0"
      image_tag(gravatar_url, class: 'gravatar img-circle', size: '75x75')
    else  
      gravatar_id = Digest::MD5::hexdigest(contact.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, class: 'gravatar img-circle', size: '75x75')
    end
  end

  def gravatar_for_large(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar', size: '60x60')
  end

  def email_for(task)
    user = User.find_by(id: task.assigned_to)
    user.email
  end

  def assigned_to(task)
    user = User.find_by(id: task.assigned_to)
    user.name
  end

  def created_by(task)
    user = User.find_by(id: task.created_by)
    if user.nil?
      task.update(created_by: task.assigned_to)
      user = User.find_by(id: task.created_by)
    end
    user.name
  end
end
