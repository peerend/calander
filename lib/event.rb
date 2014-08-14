class Event < ActiveRecord::Base

  has_many :notes
  has_many :todos

  def self.upcomming_events
    now = Time.new
    upcomming = []
    self.all.each do |event|
      if event.start_date > now
        upcomming << event
      end
    end
    upcomming
  end
end
