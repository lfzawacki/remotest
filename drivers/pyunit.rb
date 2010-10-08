require 'drivers/test_parser'

proc = Proc.new do |stdout,stderr,exitstatus|

    tests = []
	# separates the tests in [tests names, fail reasons]
    parts = stderr.split(/\n\n/)

    if exitstatus == 0
		#if it passed they're all here
        tests = parts[0].split(/\n/).map { |test| {:passed => true, :test => test} }
    else
		i = 1
        parts[0].each do |l|
          case l
            when /^(.*?\s\(.*?\)\s\.\.\.\s)ok$/ then tests << { :test => $1, :passed => true}
            when /^(.*?\s\(.*?\)\s\.\.\.\s)(ERROR|FAIL)$/ then tests << { :test => $1, :cause => parts[i], :passed => false }; i += 1 
          end
        end
    end
   tests
end

Parser = TestParser.new proc
