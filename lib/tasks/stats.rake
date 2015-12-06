namespace :stats do
  desc "Show Details of Latest Users"
  task show: :environment do
    puts "Total no. of users: #{User.count}"
    users = User.order(id: :desc).limit(10)
    puts "Latest 10 users emails: #{users.collect(&:email).join(', ')}"
    puts "Latest 10 users facebook profiles: " + users.collect{|usr| "www.facebook.com/#{usr.uid}"}.join(', ')
  end
end
