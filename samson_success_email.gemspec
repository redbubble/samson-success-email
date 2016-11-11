$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new "samson_success_email", "0.0.0" do |s|
  s.name        = "samson_success_email"
  s.summary     = "Samson email-on-success plugin"
  s.authors     = ['Redbubble']
  s.email       = 'delivery-engineers@redbubble.com'
  s.homepage    = "https://github.com/redbubble/samson-success-email"
  s.summary     = "A Samson plugin that sends email when deployment succeedes"
  s.description = "A Samson plugin that sends email when deployment succeedes"
  s.license     = "MIT"

  s.files       = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  s.test_files  = Dir["test/**/*"]

  s.add_development_dependency 'minitest', '~> 5.9.0'
  s.add_development_dependency 'rake', '~> 11.1'
end
