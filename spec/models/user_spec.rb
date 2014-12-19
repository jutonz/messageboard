require 'rails_helper'

RSpec.describe User, :type => :model do
  def user
    @user ||= users(:justin)
  end


  it 'has a default display_name of Guest' do
    expect(User.new.display_name).to eq 'Guest'
  end

  it 'has a display_name' do
    expect(user.display_name).to eq 'Justin Toniazzo'
  end

  it 'can tell you when he was created'
  it 'is invalid without an email'

  it 'is invalid without a password' do

  end
end
