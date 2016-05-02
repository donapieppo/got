namespace :got do
  namespace :users do

    desc "Create admin using gmail. "
    task :create_admin => :environment do
      print "Provide e-mail of the admin user (gmail.com): "
      email = STDIN.gets.chomp

      u = User.new(:email => email)
      u.save!
    end

  end
end

