require 'spec_helper'

describe Event do
  it 'displays events after todays date' do
    event = Event.create({:start_date => '2014-10-19 10:20:00', :end_date =>'2014-10-19 11:20:00', :location =>"Back Yard", :name => "BBQ"})
    event2 = Event.create({:start_date => '2014-02-19 10:20:00', :end_date =>'2014-02-19 11:20:00', :location =>"Back Yard", :name => "BBQ"})
    event3 = Event.create({:start_date => '2014-09-19 10:20:00', :end_date =>'2014-09-19 11:20:00', :location =>"Back Yard", :name => "BBQ"})
    expect(Event.upcomming_events).to eq [event3, event]
  end

  it 'displays events tomorrow' do
    event = Event.create({:start_date => '2014-08-15 02:20:00 -0700', :end_date =>'2014-10-19 11:20:00', :location =>"Back Yard", :name => "BBQ"})
    event2 = Event.create({:start_date => '2014-08-14 22:20:00 -0700', :end_date =>'2014-08-19 11:20:00', :location =>"Back Yard", :name => "BBQ"})
    event3 = Event.create({:start_date => '2014-09-19 10:20:00', :end_date =>'2014-09-19 11:20:00', :location =>"Back Yard", :name => "BBQ"})
    expect(Event.upcomming_day_events).to eq [event2, event]
  end
end
