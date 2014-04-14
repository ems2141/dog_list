require_relative 'dog'
require 'sequel'

DB = Sequel.connect('postgres://gschool_user:password@localhost/dog_list_development')

run Dog