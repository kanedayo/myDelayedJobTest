class Letter < ActiveRecord::Base
  def deliver
    sleep 10
    update(delivered_at: Time.zone.now)
  end
end
