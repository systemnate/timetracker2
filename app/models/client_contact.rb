class ClientContact < ActiveRecord::Base
  belongs_to :client

  def phone_number=(phone)
    write_attribute(:phone_number, phone.tr("() -", ""))
  end
end
