require 'drivers/test_parser'

class SimpleCTest
	def call stdout,stderr,exitstatus
		#this is the driver for simplectest
		cases, text = stdout.split(/\n\n/) #separate the cases from the final text

		tests = []
		lines = cases.split(/\n+/)
		lines.each_with_index do |l,i|
			if lines[i+1] != nil #just to prevent accessing the n+1 position
				if lines[i][0].chr == '>' && lines[i+1][0].chr == '['
					tests << { :test => lines[i], :cause => lines[i+1], :passed => false }
				elsif lines[i][0].chr != '['
					tests << { :test => lines[i], :passed => true }
				end
			end
		end

		tests
	end
end

Parser = TestParser.new( SimpleCTest.new )

