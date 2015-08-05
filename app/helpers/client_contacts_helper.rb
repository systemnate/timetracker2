module ClientContactsHelper
  def contact_phone_number(contact)
    if contact.phone_number.nil?
      ''
    else
      contact.phone_number
    end
  end

  def contact_email(contact)
    if contact.email.nil?
      ''
    else
      contact.email
    end
  end

  def contact_address(contact)
    if contact.address.nil?
      ''
    else
      contact.address
    end
  end

  def contact_other(contact)
    if contact.other.nil?
      ''
    else
      contact.other
    end
  end
end
