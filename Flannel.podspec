Pod::Spec.new do |s|
  s.name         = "Flannel"
  s.version      = "2.0.0"
  s.summary      = "Flannel is a stylish log formatter for CocoaLumberjack"
  s.description  = <<-DESC
                    Flannel is a stylish log formatter for CocoaLumberjack. Flannel is thread safe and formats your CocoaLumberjack log statements so that you know the class and method from which your log statement originated.
                   DESC
  s.homepage     = "https://github.com/groomsy/flannel"
  s.license      = 'MIT'
  s.author       = { "Todd Grooms" => "todd.grooms@gmail.com" }
  s.source       = { :git => "https://github.com/groomsy/flannel.git", :tag => "#{s.version}" }
  
  s.requires_arc = true
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source_files = 'Pod/Classes'
  
  s.dependency 'CocoaLumberjack', '~> 2.0.0-rc'
end
