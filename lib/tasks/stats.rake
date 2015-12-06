namespace :stats do
  desc "Show Details of Latest Users"
  task show: :environment do
    puts "Total no. of needy people: #{Needee.count}"
    puts "Total no. of volunteer: #{User.count}"
    users = User.order(id: :desc).limit(10)
    puts "Latest 10 volunteer emails: #{users.collect(&:email).join(', ')}"
    puts "Latest 10 volunteer facebook profiles: " + users.collect{|usr| "www.facebook.com/#{usr.uid}"}.join(', ')
  end
end
