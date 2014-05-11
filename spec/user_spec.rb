require_relative 'spec_helper'



describe 'User' do 

	it 'should have a name, user_name, password and email' do 
		expect(User.count).to be(0)
		User.create(:name => "robin", :user_name => "robin_user", :email => "robin@test.com", :password => "password")
		expect(User.count).to be(1)
	end



end