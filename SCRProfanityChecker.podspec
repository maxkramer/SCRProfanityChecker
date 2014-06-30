
Pod::Spec.new do |s|
  s.name         = "SCRProfanityChecker"
  s.version      = "0.0.2"
  s.summary      = "A drop-in profanity checker for files and strings"
  s.homepage     = "https://github.com/MaxKramer/SCRProfanityChecker"
  s.license      = "MIT"
  s.author             = { "Max Kramer" => "max@maxkramer.co" }
  s.social_media_url   = "http://twitter.com/MaxKramer"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/MaxKramer/SCRProfanityChecker.git", :tag => "v0.0.2" }
  s.source_files  = "src/*.{h,m}"
  s.resource  = "src/res/Profanity.txt"
  s.requires_arc = true
end
