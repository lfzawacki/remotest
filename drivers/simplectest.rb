require 'drivers/test_parser'

class SimpleCTest
	def call stdout,stderr,exitstatus
		#this is the driver for simplectest
		cases, text = stdout.split(/\n\n/) #separate the cases from the final text

		tests = {:passed => [], :failed => [] }
		lines = cases.split(/\n+/)
		lines.each_with_index do |l,i|
			if lines[i+1] != nil #just to prevent accessing the n+1 position
				if lines[i][0].chr == '>' && lines[i+1][0].chr == '['
					tests[:failed] << { :test => lines[i], :cause => lines[i+1] }
				elsif lines[i][0].chr != '['
					tests[:passed] << lines[i]
				end
			end
		end

		tests
	end
end

Parser = TestParser.new( SimpleCTest.new )

