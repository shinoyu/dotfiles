execute "xcode" do 
	not_if command "xcode-select -h"
	command "xcode-select --install"
end

execute "homebrew" do 
	not_if command "brew -v"
	command "ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
	command "brew doctor"
end

# include other cookbooks/**
# include_cookbook...
