require "bundler"
Bundler::GemHelper.install_tasks name: "uswds-jekyll"

task default: "serve"

desc "Serve the Jekyll site"
task :serve do
  system('bundle exec jekyll serve')
end

desc "Update to latest USWDS"
task :update do
  puts "Updating USWDS..."
  system('npm install --save uswds@latest')
  system('npm run setup-uswds')
end
