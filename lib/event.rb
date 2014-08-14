class Event < ActiveRecord::Base

  has_many :notes
  has_many :todos

  def self.upcomming_events
    now = Time.new
    upcomming = []
    ordered_list = self.order(:start_date)
    ordered_list.all.each do |event|
      if event.start_date > now
        upcomming << event
      end
    end
    upcomming
  end
  def self.upcomming_day_events
    now = Time.new
    upcomming_day = []
    self.upcomming_events.each do |event|
      if event.start_date <= now + 1.day
        upcomming_day << event
      end
    end
    upcomming_day
  end
end
