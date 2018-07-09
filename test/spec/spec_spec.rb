require "test_helper"

describe Riseup::Spec do
	it "raises an exception when incorrect arguments are provided" do
		assert_raises ArgumentError do
			Riseup::Spec.new()
		end

		assert_raises ArgumentError do
			Riseup::Spec.new("Mamma mia!")
		end

		assert_raises ArgumentError do
			Riseup::Spec.new(["lol","xd"])
		end

		assert_raises ArgumentError do
			Riseup::Spec.new([[]])
		end

		assert_raises ArgumentError do
			Riseup::Spec.new([["A"]])
		end

		assert_raises ArgumentError do
			Riseup::Spec.new([["E","E","H","XP"]])
		end
	end
end
