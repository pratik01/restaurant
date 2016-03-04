namespace :my_namespace do

  task :task1 => :development do
    puts "test task"
  end

  task :task1 => :production do
    puts "test task"
  end

  task :task1 => :test do
    puts "test task"
  end

end


