task :default => :build_mojo

desc "Builds the deployable iOS package"
task :build_mojo => [:pull_from_git, :import_p12_into_keychain, :import_provision_profile, :copy_branding_images, :set_plist_vars] do
	puts "Building Mojo..."
end

desc "Gets the latest version of the development source code"
task :pull_from_git do
	puts "Pulling from git..."
end

desc "Checks to make sure there is a *.p12 file to use to sign the code"
task :check_for_p12_file do
	puts "Checking for *.p12 file..."
end

desc "Imports the certificate for signing the code into the build service keychain"
task :import_p12_into_keychain => :check_for_p12_file do
	puts "Importing *.p12 into keychain..."
end

desc "Checks to make sure there is a *.mobileprovision file"
task :check_for_provision_profile do
	puts "Checking for *.mobileprovision file..."
end

desc "Copies the *.mobileprovision file to the build server's folder"
task :import_provision_profile => :check_for_provision_profile do
	puts "Importing provision profile..."
end

desc "Checks to see if there are available branding images for the FI"
task :check_for_branding_images do
	puts "Checking for branding images..."
end

desc "copies the branding images into the current development code"
task :copy_branding_images => :check_for_branding_images do
	puts "Copying branding images..."
end

desc "sets all FI-specific settings for the build of Mojo"
task :set_plist_vars do
	puts "updating plist values..."
end
