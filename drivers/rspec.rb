require 'drivers/test_parser'

class RSpec
	def call stdout,stderr,exitstatus
		#this is the driver for simplectest
		
		tests
	end
end

Parser = TestParser.new( RSpec.new )

