require "bundler/gem_tasks"
task :default => :spec

desc "Run spec"
task :spec do
  from_tag = 'itamae-plugin-resource-aur_package-from:from'
  sh "docker build -t #{from_tag} spec/docker/"
  to_tag = 'itamae-plugin-resource-aur_package:to'
  sh 'bundle', 'exec', 'itamae', 'docker', 'spec/recipes/main.rb', "--image=#{from_tag}", "--tag=#{to_tag}", "--log-level=debug"
  sh({ 'DOCKER_IMAGE' => to_tag }, "bundle", 'exec', 'rspec')
end
