admin = Employee.new(admin: true,
                     email: 'admin@admin.com',
                     password: 'adminqwe',
                     password_confirmation: 'adminqwe',
                     last_name: 'admin',
                     first_name: 'admin',
                     gender: 'admin',
                     service_start_date: Time.now,
                     substantive_rank: 'root',
                     service_no: 1,
                     date_of_birth: Time.now,
                     confirmed_at: Time.now)

admin.save

user = Employee.last
user2 = Employee.first

user.promotion_dates.create(substantive_rank: 'rank1', date: Time.now, rank_point: 1)
user.promotion_dates.create(substantive_rank: 'rank2', date: Time.now + 3.days, rank_point: 2 )
user.promotion_dates.create(substantive_rank: 'rank3', date: Time.now + 1.week, rank_point: 3)
user.promotion_dates.create(substantive_rank: 'rank4', date: Time.now + 2.weeks, rank_point: 4)

[user, user2].each do |user|
  user.events.create(name: 'event1', event_type: 'type1', start_date: Time.now, end_date: Time.now + 1.day)
  user.events.create(name: 'event2', event_type: 'type1', start_date: Time.now + 2.days, end_date: Time.now + 4.days)
  user.events.create(name: 'event3', event_type: 'type3', start_date: Time.now + 1.days, end_date: Time.now + 3.days)
  user.events.create(name: 'event4', event_type: 'type4', start_date: Time.now + 1.week, end_date: Time.now + 2.weeks)
  user.events.create(name: 'event5', event_type: 'type4', start_date: Time.now + 1.month, end_date: Time.now + 2.month)
  user.events.create(name: 'event6', event_type: 'type6', start_date: Time.now + 2.month, end_date: Time.now + 2.month)
end


user.announcements.create(title: 'Title 1', body: 'Some body 1')
user.announcements.create(title: 'Title 1', body: 'Some body 2')
user.announcements.create(title: 'Title 3', body: 'Some body 3')


# - each Parent can manage their descendents (through Ancestry Gem).
# - Employees can see their own profile details except for their Notes which only their managers can see.
# - Other Employees not direct superiors can only see the basic details within the top profile block.
# - Non-logged in users should not be able to access any of the site.
# - The admin attribute in the Employee model should allow access to the whole site.
# - Employees can create, edit and destroy their Addresses, Contact Numbers (Phones), Next of Kins.
# - Everything else can only be created/edited by their superiors.
# - Only admins can create new users, roles, responsibilities.
