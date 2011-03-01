ssh_user    = ""
remote_root = ""
ssh_key     = ""

desc "Runs preview"
task :preview do
  puts "** starting preview server **"
  system "staticmatic preview ."
end

desc "Build the site"
task :build => ["styles:clear", "javascripts:generate"] do
  puts "** building site **"
  system "staticmatic build ."
end

desc "Clear and generate new styles, build, and deploy"
task :deploy => :build do
  puts "** deploying site **"
  system("rsync -avz --rsh \"ssh -i #{ssh_key}\" --delete site/ #{ssh_user}:#{remote_root}")
end

namespace :images do
  desc "Synch images from src to site"
  task :synch do
    puts "** synching images **"
    system("rsync -avz -q --delete src/images site")
  end
end

namespace :javascripts do
  desc "Clear javascripts"
  task :clear do
    puts "** clearing javascripts **"
    system "rm -Rfv site/javascripts/*"
  end

  desc "Generate javascripts"
  task :generate => :clear do
    puts "** generating javascripts **"
    system "jammit -c config/assets.yml -o site/javascripts -f"
  end
end

namespace :styles do
  desc "Clear styles"
  task :clear do
    puts "** clearing styles **"
    system "rm -Rfv site/stylesheets/*"
  end

  desc "Regenerate styles"
  task :generate => :clear do
    puts "** generating styles **" 
    system "compass compile -c config/compass.rb"
  end
end
