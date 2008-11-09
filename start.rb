require 'rubygems'
require 'ramaze'

acquire 'src/model/*'
acquire 'src/*'

Ramaze.start :port => 9001, :adapter => :mongrel
