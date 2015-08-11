# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


User.create([:name => 'Sarah', :email => 'sarah@sarah.com', :password => 'sarah123', :password_confirmation => 'sarah123', :is_vineyard => 1, :city => 'Brooklyn', :state => 'New York', :country => 'USA'])
User.create([:name => 'David', :email => 'david@david.com', :password => 'david123', :password_confirmation => 'david123', :is_vineyard => 1, :city => 'New York', :state => 'New York', :country => 'USA'])
User.create([:name => 'Anna', :email => 'anna@anna.com', :password => 'annae123', :password_confirmation => 'annae123', :is_vineyard => 0, :city => 'Moscow', :country => 'Russia'])
User.create([:name => 'John Smith', :email => 'john@smith.com', :password => 'johns123', :password_confirmation => 'johns123', :is_vineyard => 0, :city => 'Houston', :state => 'TX', :country => 'USA'])
