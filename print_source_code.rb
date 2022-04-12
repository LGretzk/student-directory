def hello_world
   puts "Hello world" 
end

def print_source_code
  open(__FILE__, mode = "r") { |file|
    file.readlines.each do |line|
        puts line 
    end  
  }    
end

print_source_code
