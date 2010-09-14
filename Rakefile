ssh_user = "user@domain.com" # for rsync deployment
remote_root = "~/path/to/remote/" # for rsync deployment

desc "Runs preview"
task :preview => 'assets:copy' do
  system "bundle exec staticmatic preview ."
end

desc "Builds the site"
task :build => 'assets:copy' do
  puts "*** Building the site ***"
  system "bundle exec staticmatic build ."
end

desc "Clears and generates new styles, builds and deploys"
task :deploy => :build do
  puts "*** Deploying the site ***"
  system("rsync -avz --delete site/ #{ssh_user}:#{remote_root}")
end

desc "Clears the site folder"
task :clear do
  puts "*** Clearing site folder ***"
  system "rm -Rf site"
  mk_build_dir 'site'
end



namespace :assets do
  desc "Copy site assets (images, javascripts…)"
  task :copy => :clear do
    puts "*** Copy site assets ***"
    directory 'site'
    files = FileList[File.join('src','assets','*')]
    files.each do |source|
      target = source.sub('src/assets', 'site')
      cp_r source, target
    end
  end
end



namespace :styles do
  desc "Clears the styles"
  task :clear do
    puts "*** Clearing styles ***"
    system "rm -Rfv site/stylesheets/*"
  end
  
  desc "Generates new styles"
  task :generate => :clear do
    puts "*** Generating styles ***"
    system "bundle exec compass"
  end
end




# Utils
# -----

def mk_build_dir(path)
  mkdir path
  gitignore = File.join(path, '.gitignore')
  File.open(gitignore, 'w') do |f|  
    f.puts "*\n!.gitignore"  
  end
end
