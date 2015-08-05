module ClientContactsHelper
  def contact_phone_number(contact)
    if contact.phone_number.blank?
      ''
    else
      contact.phone_number + " | "
    end
  end

  def contact_email(contact)
    if contact.email.blank?
      ''
    else
      contact.email
    end
  end

  def contact_address(contact)
    if contact.address.blank?
      ''
    else
      contact.address
    end
  end

  def contact_other(contact)
    if contact.other.blank?
      ''
    else
      contact.other
    end
  end
end
