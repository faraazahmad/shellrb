task default: %w[install]

task :install do
    sh 'gem install bundler'
    sh 'bundle install'
end

task :run do
    ruby 'lib/app.rb'
end

task :test do
    sh 'rspec'
end

task :upgrade do
    sh 'git pull origin master'
end

task :update do
    sh 'bundle install'
end