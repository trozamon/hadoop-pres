require 'erb'

task :default do
  puts "Generating presentation..."
  pres = String.new

  File.open('index.html.erb') do |f|
    erb = ERB.new(f.read())
    pres = erb.result
  end

  File.open('index.html', 'w') do |f|
    f.write(pres)
  end
end
