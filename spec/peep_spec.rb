require_relative 'spec_helper'
require 'user'


describe Peep do 

	it 'demonstration of how peeps work, a peep can be created and destroyed' do
		expect(Peep.count).to eq(0)
		user = User.create(:name => "robin", :user_name => "robin_user", :email => "robin@test.com", :password => "password")
		peep = Peep.create(:peep => "This is a peep test", :user_id => user.id)
		expect(Peep.count).to eq(1) 
	end

	it 'must belong to a user' do 
		user = User.create(:name => "robin", :user_name => "robin_user", :email => "robin@test.com", :password => "password")
		peep = Peep.create(:peep => "This is a peep test", :user_id => user.id)
		expect(peep.user.name).to eq("robin")
	end



end