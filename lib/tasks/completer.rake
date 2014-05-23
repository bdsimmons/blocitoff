namespace :items do

  desc 'Removes old items after 7 days'
  task :delete => :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

  desc 'Removes all completed items'
  task :purge => :environment do
    Item.where("completed_at IS NOT NULL").destroy_all
  end

end