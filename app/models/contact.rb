class Contact < ApplicationRecord
  def friendly_updated_at
    friendly_time = created_at.strftime("%b %e, %l:%M %p")
    p friendly_time
  end

  def add_japan_code
    japan_code = "+ 81"
  end
end
