require_relative 'spec_helper'

describe Peep do 

	it 'demonstration of how peeps work, a peep can be created and destroyed' do
		expect(Peep.count).to eq(0)
		Peep.create(:peep => "This is a peep test")
		expect(Peep.count).to eq(1) 
	end


end