Gem::Specification.new do |s|
    s.name = 'spree'
    s.version = '0.0.1'
    s.summary = 'A complete commerce solution for Ruby on Rails.'
    s.description = "Spree is a complete commerce solution designed for use by experienced Rails developers. No solution can possibly solve everyone’s needs perfectly. There are simply too many ways that people do business for us to model them all specifically. Rather then come up short (like so many projects before it), Spree’s approach is to simply accept this and not even try. Instead Spree tries to focus on solving the 90% of the problem that most commerce projects face and anticipate that the other 10% will need to be addressed by the end developer familiar with the client’s exact business requirements."
    s.author = "Sean Schofield"
    s.email = "sean.schofield@gmail.com"
    s.homepage = 'http://spreecommerce.com/'
    s.rubyforge_project = 'spree'
    s.platform = Gem::Platform::RUBY
    s.bindir = 'bin'
    s.executables = ['spree']
    s.add_dependency 'rake', '>= 0.7.1'
    s.add_dependency 'highline', '>= 1.4.0'
    s.add_dependency 'rails', '= 2.3.2'
    s.add_dependency 'activemerchant', '>= 1.4.1'
    s.add_dependency 'activerecord-tableless', '>= 0.1.0' 
    s.add_dependency 'calendar_date_select', '= 1.15' 
    s.add_dependency 'tlsmail', '= 0.0.1' 
    s.add_dependency 'rspec', '>= 1.2.0'
    s.add_dependency 'rspec-rails', '>= 1.2.0' 
    # For some reason the authlogic dependency really screws things up (See Issue #433)
    #s.add_dependency 'authlogic', '>= 2.0.11'
    s.has_rdoc = true
    #s.rdoc_options << '--title' << RDOC_TITLE << '--line-numbers' << '--main' << 'README'
    rdoc_excludes = Dir["**"].reject { |f| !File.directory? f }
    rdoc_excludes.each do |e|
      s.rdoc_options << '--exclude' << e
    end
    #s.extra_rdoc_files = RDOC_EXTRAS
    files = FileList['**/*']
    files.exclude '**/._*'
    files.exclude '**/*.rej'
    files.exclude 'cache/'
    #files.exclude 'config/database.yml'
    files.exclude 'config/locomotive.yml'
    files.exclude 'config/lighttpd.conf'
    files.exclude 'config/mongrel_mimes.yml'
    files.exclude 'db/*.db'
    files.exclude 'db/*.sqlite3'
    files.exclude 'db/*.sql'
    files.exclude 'db/*.rb'
    files.exclude /^doc/
    files.exclude 'log/*.log'
    files.exclude 'log/*.pid'
    #files.include 'log/.keep'
    files.exclude /^pkg/
    files.include 'public/.htaccess.example'
    files.exclude 'public/images/products'
    files.exclude 'tmp/'
    s.files = files.to_a
  end