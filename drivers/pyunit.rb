require 'drivers/test_parser'

proc = Proc.new do |stdout,stderr,exitstatus|

    tests = { :passed => [], :failed => [] }
    parts = stderr.split(/\n\n/)

    if exitstatus == 0
        puts 'fu'
        test[:passed] = parts[0].split(/\n/)
    else
		i = 1
        parts[0].each do |l|
          case l
            when /^(.*?\s\(.*?\)\s\.\.\.\s)ok$/ then tests[:passed] << $1
            when /^(.*?\s\(.*?\)\s\.\.\.\s)(ERROR|FAIL)$/ then tests[:failed] << { :test => $1, :cause => parts[i] }; i += 1 
          end
        end
    end
   tests
end

Parser = TestParser.new proc

