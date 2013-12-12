# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

BunchType.names_bunch.each do |name|
  @bunch_type = BunchType.create(name: name)
end