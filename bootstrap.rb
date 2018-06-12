MItamae::RecipeContext.class_eval do 
 def root_dir
  @@root_dir ||= File.expand_path('..', __FILE__)
 end

 def include_cookbook(name) 
  include_recipe(File.join(root_dir, "cookbook", name, "default"))
 end

 def include_role(name)
  include_recipe(File.join(root_dir, "roles", name, "default"))
 end

 def ask(params)
  puts "run recipe? #{params}. [y/N]"
  case answer=gets.chomp.to_s
   when "y", "yes"
    return true
   when  "N", "no", "No"
    return false
   else
    puts "ask failed. skip #{params}."
  end
 end
end

 include_role node[:platform]
