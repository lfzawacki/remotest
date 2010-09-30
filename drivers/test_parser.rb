class TestParser

	# receives an object that responds to call, and sets
    # it as the current parser
	def initialize proc
		@parser = proc
	end

	#
	# parse_tests
	# receives the output of the command that ran the tests
	# and must return a hash of { :passed => [passed,tests], :fail => [failed,tests] }
	def parse_tests stdout,stderr,exitstatus
		@parser.call(stdout,stderr,exitstatus)
	end
end

