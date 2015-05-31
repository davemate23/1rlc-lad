# require 'rails_helper'

# describe 'Roles' do
#   let(:admin)  { create(:employee, :admin) }
#   let!(:role)  { create(:role) }

#   before do
#     login_as admin
#     visit roles_path
#   end

#   specify 'show' do
#     within "#role-#{role.id}" do
#       click_on 'Show'
#     end

#     expect(page).to have_content("PID: #{role.pid}")
#     expect(page).to have_content("Description: #{role.description}")
#     expect(page).to have_link('Edit', href: edit_role_path(role))
#     expect(page).to have_link('Assignment', href: role_assignments_path(role))
#     expect(page).to have_link('Back', href: roles_path)
#   end

#   specify 'index' do
#     within "#role-#{role.id}" do
#       expect(page).to have_selector('td', text: role.pid)
#       expect(page).to have_selector('td', text: role.description)
#       expect(page).to have_link('Show', href: role_path(role))
#       expect(page).to have_link('Edit', href: edit_role_path(role))
#       expect(page).to have_link('Destroy', href: role_path(role))
#     end
#   end

#   describe 'new' do
#     before do
#       click_on 'New Role'
#       expect(page).to have_link('Back', href: roles_path)
#     end

#     specify 'success' do
#       fill_in 'role_pid', with: 'Some pid'
#       fill_in 'role_description', with: 'Some description'

#       click_on 'Create Role'

#       expect(page).to have_content('Role was successfully created.')
#     end

#     specify 'failure' do
#       click_on 'Create Role'

#       expect(page).to have_selector('#role_pid + .help-block', text: "can't be blank")
#       expect(page).to have_selector('#role_description + .help-block', text: "can't be blank")
#     end
#   end

#   describe 'edit' do
#     before do
#       within "#role-#{role.id}" do
#         click_on 'Edit'
#       end

#       expect(page).to have_link('Back', href: roles_path)
#     end

#     specify 'success' do
#       fill_in 'role_pid', with: 'Some new pid'
#       fill_in 'role_description', with: 'Some new description'

#       click_on 'Update Role'

#       expect(page).to have_content('Role was successfully updated.')
#     end

#     specify 'failure' do
#       fill_in 'role_pid', with: nil
#       fill_in 'role_description', with: nil

#       click_on 'Update Role'

#       expect(page).to have_selector('#role_pid + .help-block', text: "can't be blank")
#       expect(page).to have_selector('#role_description + .help-block', text: "can't be blank")
#     end
#   end

#   specify 'destroy' do
#     within "#role-#{role.id}" do
#       click_on 'Destroy'
#     end

#     expect(page).to have_content('Role was successfully destroyed.')
#     expect(page).not_to have_selector("role-#{role.id}")
#   end
# end
