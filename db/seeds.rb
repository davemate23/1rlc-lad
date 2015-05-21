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

# - each Parent can manage their descendents (through Ancestry Gem).
# - Employees can see their own profile details except for their Notes which only their managers can see.
# - Other Employees not direct superiors can only see the basic details within the top profile block.
# - Non-logged in users should not be able to access any of the site.
# - The admin attribute in the Employee model should allow access to the whole site.
# - Employees can create, edit and destroy their Addresses, Contact Numbers (Phones), Next of Kins.
# - Everything else can only be created/edited by their superiors.
# - Only admins can create new users, roles, responsibilities.
