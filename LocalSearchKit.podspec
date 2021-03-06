Pod::Spec.new do |s|
  s.name             = "LocalSearchKit"
  s.version          = "0.1.2"
  s.summary          = "Addition to MKLocalSearch to handle multiple search queries"
  s.description      = <<-DESC
                       MKLocalSearch is a local POI search feature released by Apple.

                       * It doesn't easily handle multiple queries
                       * This is an addition of classes that help handle multiple queries simulatenously and effeciently.
		       * Uses NSOperations to make search operation make effecient. 
                       DESC
  s.homepage         = "https://github.com/harishkashyap/LocalSearchKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Harish Krishnamurthy" => "hkashyap@icloud.com" }
  s.source           = { :git => "https://github.com/harishkashyap/LocalSearchKit.git", :tag => "0.1.2" }
  # s.social_media_url = 'https://twitter.com/hkashyap'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
 # s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'DataStructures'
end
