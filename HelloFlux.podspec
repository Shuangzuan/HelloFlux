Pod::Spec.new do |s|
  s.name         = "HelloFlux"
  s.version      = "0.0.1"
  s.summary      = "An application architecture for React utilizing a unidirectional data flow."
  s.description  = <<-DESC
                   Application Architecture for Building User Interfaces http://facebook.github.io/flux/
                   DESC
  s.homepage     = "https://github.com/Shuangzuan/HelloFlux"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Shuangzuan" => "shuangzuan.he@icloud.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Shuangzuan/HelloFlux.git", :tag => "0.0.1" }
  s.source_files = "Flux"
  s.requires_arc = true
end
