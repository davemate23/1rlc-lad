require 'rails_helper'

describe AssignmentsController do
  let!(:user)         { create(:employee, :admin) }
  let!(:assignment1) { create(:assignment, resource: user) }
  let!(:assignment2) { create(:assignment, resource: user) }

  before { login_as(user) }

  # specify 'GET #index' do
  #   get :index, employee_id: user.id

  #   assignments = assigns(:assignments)
  #   expect(response).to render_template(:index)
  #   expect(assignments).to eq [assignment1, assignment2]
  # end

  # specify 'GET #show' do
  #   get :show, id: role1.id

  #   role = assigns(:role)
  #   expect(response).to render_template(:show)
  #   expect(role).to eq role1
  # end

  # specify 'GET #edit' do
  #   get :edit, id: role1.id

  #   role = assigns(:role)
  #   expect(response).to render_template(:edit)
  #   expect(role).to eq role1
  # end

  # specify 'GET #new' do
  #   get :new

  #   role = assigns(:role)
  #   expect(response).to render_template(:new)
  #   expect(role).to be_new_record
  # end

  # describe 'POST #create' do
  #   specify 'success' do
  #     expect {
  #       post :create, role: attributes_for(:role)
  #     }.to change(Role, :count).by(1)

  #     role = assigns(:role)
  #     expect(response).to redirect_to(role_path(role))
  #   end

  #   specify 'failure' do
  #     expect {
  #       post :create, role: attributes_for(:role, pid: nil)
  #     }.not_to change(Role, :count)

  #     expect(response).to render_template(:new)
  #   end
  # end

  # describe 'PATCH #update' do
  #   let(:attrs) { attributes_for(:role) }

  #   specify 'success' do
  #     expect {
  #       patch :update, id: role1.id, role: attrs
  #     }.not_to change(Role, :count)

  #     expect(response).to redirect_to(role_path(role1))

  #     role1.reload do |role|
  #       expect(role.pid).to eq attrs[:pid]
  #       expect(role.description).to eq attrs[:description]
  #     end
  #   end

  #   specify 'failure' do
  #     attrs[:pid] = nil

  #     expect {
  #       patch :update, id: role1.id, role: attrs
  #     }.not_to change(Role, :count)

  #     expect(response).to render_template(:edit)
  #   end
  # end

  # specify 'DELETE destroy' do
  #   expect {
  #     delete :destroy, id: role1.id
  #   }.to change(Role, :count).by(-1)

  #   expect(response).to redirect_to(roles_path)
  # end
end
