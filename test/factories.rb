
Factory.define :user, :class => User do |f|
  f.first_name "User"
  f.sequence(:last_name) {|n| "last_name#{n}"}
  f.sequence(:email) {|n| "user#{n}@msn.com"}
  f.password "asdf"
  f.password_confirmation "asdf" 
end

Factory.define :babysitter, :parent => :user do |f|
end

Factory.define :adult, :parent => :user do |f|
end

Factory.define :amanda, :parent => :babysitter do |f|
  f.first_name "Amanda"
  f.last_name "Barker"
  f.email "amanda@msn.com"
end

Factory.define :morgan, :parent => :babysitter do |f|
  f.first_name "Morgan"
  f.last_name "Taylor"
end

Factory.define :rich, :parent => :adult do |f|
  f.first_name "Rich"
  f.last_name "Johnson"
  f.email "rich@msn.com"
end

Factory.define :kristy, :parent => :adult do |f|
  f.first_name "Kristy"
  f.last_name "Reidelberger"
  f.email "kristy@msn.com"
end

Factory.define :dinner, :class => Event do |e|
  e.name "Dinner"
  e.event_date 1.day.ago
  e.start_time "6pm"
  e.end_time "10pm"
  e.note "thanks"
end

Factory.define :event, :class => Event do |e|
  e.name "Big event"
  e.event_date Date.today
  e.start_time "6pm"
  e.end_time "10pm"
  e.note "thanks again"
end

Factory.define :user_with_historic_events, :parent => :rich do |user|
  user.after_build do |u|
    u.events << Factory.build(:event, :user => u, :event_date => 4.days.ago)
    u.events << Factory.build(:event, :user => u, :event_date => 3.days.ago)
  end
end

Factory.define :user_with_upcoming_events, :parent => :rich do |user|
  user.after_build do |u|
    u.events << Factory.build(:event, :user => u, :event_date => -5.days.ago)
    u.events << Factory.build(:event, :user => u, :event_date => -4.days.ago)
    u.events << Factory.build(:event, :user => u, :event_date => -3.days.ago)
  end
end

# Factory.define :wedding, :class => Event do |e|
  # e.name "Wedding"
  # e.eventDate "12-1-2010"
  # e.startTime "6pm"
  # e.endTime "10pm"
  # e.note "thanks"
# end
# 
# Factory.define :yes_reply, :class => Reply do |r|
  # r.answer "Yes"
  # r.note "Thanks"
# end
# 
# Factory.define :no_reply, :class => Reply do |r|
  # r.answer "No"
  # r.note "Sorry"
# end
# 
# Factory.define :invitation, :class => Invitation do |i|
  # i.email "amanda@msn.com"
# end
