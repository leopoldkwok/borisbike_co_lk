
require './lib/bike' #requiring the file so, needs to be exact!
#we're describing the functionality of a specific class, Bike
describe Bike do

	let(:bike) {Bike.new}
	#this is a specific feature (behaviour)
	# that we expect to be present
	it "should not be broken after we create it" do
		# initialise a new object of Bike Class NOTE: says THE_BIKE which is later changed anyway!
		#expect an instance of this class to have
		# a method "broken?" that should return false
		expect(bike).not_to be_broken
	end

	it "should be able to break" do
		bike.break! #typo in the notes
		expect(bike).to be_broken
	end

	it "should be able to get fixed" do
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end
end