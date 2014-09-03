Gem::Specification.new do |s|
	# Info.
	s.name        = 'jekyll-i18n'
	s.version     = '1.0.3'
	s.date        = '2014-09-03'
	s.summary     = "A Jekyll plugin to facilitate basic multilingual websites."
	s.description = <<-EOF
		jekyll-i18n is a Jekyll plugin that introduces a 't' tag/filter that translates phrases based on translation files found in _i18n/*.yml. It also introduces new mechanisms in the build process for generating language-specific posts and pages based on the language specified in the filename. 
	EOF
	s.author      = "Liam Edwards-Playne"
	s.email       = 'liamzebedee@yahoo.com.au'
	s.homepage    = 'http://rubygems.org/gems/jekyll-i18n'
	s.license     = 'GPL-3'
	
	s.add_runtime_dependency 'jekyll'
	gem "i18n", "~> 0.6.4"
	
	s.files       = ["lib/jekyll-i18n.rb", 'README.md', 'LICENSE']
end
