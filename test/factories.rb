
Factory.define :user, :class => User do |f|
  f.first_name "User"
  f.sequence(:last_name) {|n| "last_name#{n}"}
  f.sequence(:email) {|n| "user#{n}@msn.com"}
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

# Factory.define :dinner, :class => Event do |e|
  # e.name "Dinner"
  # e.eventDate "12-1-2010"
  # e.startTime "6pm"
  # e.endTime "10pm"
  # e.note "thanks"
# end
# 
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
