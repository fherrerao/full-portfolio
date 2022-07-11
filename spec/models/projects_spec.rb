require 'rails_helper'

RSpec.describe Project, type: :model do
  before :each do
    User.destroy_all
    
    @user = User.new(email: 'abc@abc.com', password: '123456', role: 'admin' )
    @user.skip_confirmation!
    @user.save!
    
    Project.destroy_all
    @project = Project.new(title: 'title_1', description: 'good news', tech_1: 'ruby', tech_2: 'rails', user_id: @user.id)
    @project.save!
  end

  it 'user should be valid' do
    expect(@user).to  be_valid
  end

  it 'project should be valid' do
    expect(@project).to be_valid
  end

  it 'should not be valid without a title' do
    @project.title = nil
    expect(@project).to_not be_valid
  end

  it 'should not be valid without a description' do
    @project.description = nil
    expect(@project).to_not be_valid
  end

  it 'should not be valid without a description' do
    @project.tech_1 = nil
    expect(@project).to_not be_valid
  end

  it 'should not be valid without a description' do
    @project.tech_2 = nil
    expect(@project).to_not be_valid
  end
end
