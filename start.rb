require 'rubygems'
require 'ramaze'
require 'm4dbi'

$db = DBI.connect( 'DBI:Pg:todolist', 'todolist', '' )

acquire 'src/model/*'
acquire 'src/*'

Ramaze.start :port => 9001, :adapter => :mongrel
