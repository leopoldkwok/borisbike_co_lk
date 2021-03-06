require 'docking_station'

describe DockingStation do

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }



	it "should accept a bike" do
		# we expect the station to have 0 bikes 
		expect(station.bike_count).to eq(0)
		# let's dock a bike into the station
		station.dock(bike)
		# now we expect the station to have 1 bike 
		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(station).not_to be_full
		fill_station station
		expect(station).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_station station
		expect(lambda {station.dock(bike)}).to raise_error(RuntimeError)
	end

	def fill_station(station)
		20.times {station.dock(Bike.new)}
	end



end
