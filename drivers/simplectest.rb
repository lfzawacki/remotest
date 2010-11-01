require 'drivers/test_parser'

class SimpleCTest
	def call stdout,stderr,exitstatus
		#this is the driver for simplectest
		cases, text = stdout.split(/\n\n/) #separate the cases from the final text

		tests = []
		lines = cases.split(/\n+/)

		lines.each_with_index do |l,i|
			if lines[i+1] != nil #just to prevent accessing the n+1 position
				# tests for a fail
				if lines[i][0].chr == '>' && lines[i+1][0].chr == '['
					test_text = lines[i]
					#removes trailling dots
					test_text = test_text[0,test_text.size-3]
					fail_cause = lines[i+1]
					fail_cause = fail_cause[6, fail_cause.size]

					tests << { :test => test_text, :cause => fail_cause, :passed => false }
				elsif lines[i][0].chr != '['
					test_text = lines[i]
					#removes trailling dots
					test_text = test_text[0,test_text.size-3]

					tests << { :test => test_text, :passed => true }
				end
			end
		end

		tests
	end
end

Parser = TestParser.new( SimpleCTest.new )

