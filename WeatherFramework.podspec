Pod::Spec.new do |s|
s.name         = "WeatherFramework"
s.version      = "1.0.0"
s.summary      = "A weather framework that gets weather information for each city."
s.description  = "A weather framework that can be used in ios Apps to get weather information for cities added by the user"
s.homepage     = "https://www.groupe-psa.com/fr/"
s.license      = "MIT"
s.author       = "Amine AKKARI"
s.platform     = :ios, "11.0"
s.source       = {:git => 'https://github.com/Amine-AKKARI/PSA.git', :tag => "#{s.version}"}
s.source_files = "WeatherFramework/WeatherFramework"
s.swift_version = "5.0" 

end