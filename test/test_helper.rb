require "rack/test"
require "test/unit"

d = File.join(File.dirname(__FILE__), "..", "lib") #=> "test/../lib" 
$LOAD_PATH.unshift File.expand_path(d)

# by prepending the local path to the "rulers.rb" file, we make sure that requiring "rulers"
# wil require the LOCAL ONE in the current directory rather than, say, the one installed as a gem
require "rulers"