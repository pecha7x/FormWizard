# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
user_admin = User.create({
                           email: 'artempecherin@gmail.com',
                           password: '12345678',
                           password_confirmation: '12345678',
                           admin: true,
});