require "test_helper"

describe Riseup::Parser do
	it "ensures arguments" do
		assert_raises ArgumentError do
			Riseup::Parser.new()
		end
		assert_raises ArgumentError do
			Riseup::Parser.new(1)
		end
		assert_raises ArgumentError do
			Riseup::Parser.new("","")
		end
		assert_raises ArgumentError do
			Riseup::Parser.new("",Riseup::Spec.new([]),"")
		end
	end
	
	it "has working default markup" do
		assert_equal Riseup::Parser.new("*Dr. Pavel*, I'm **CIA**.\n").parse(),"<i>Dr. Pavel</i>, I'm <b>CIA</b>.<br/>"
		assert_equal Riseup::Parser.new("\\*He wasn't alone.\\*").parse(),"*He wasn't alone.*"
	end
	it "works with custom markup" do
		assert_equal Riseup::Parser.new("lol  \n:xdlmaotbqfhfamalam:",
			Riseup::Spec.new([["  \n","\n"],
		  	[":xdlmaotbqfhfamalam:","😂"]
				])).parse(),"lol\n😂"
	end
end
