#
#  Be sure to run `pod spec lint EasyUserDefault.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "EasyUserDefault"
  s.version      = "1.0.1"
  s.summary      = "Easy and elegant uses UserDefault"
  s.description  = "Check any valid type before you save or after saved"
  s.homepage     = "https://github.com/vincentLin113/EasyUserDefault"
  s.license      = "MIT"
  s.author             = { "Vincent Lin" => "keepexcelsior@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/vincentLin113/EasyUserDefault.git", :tag => "#{s.version}" }

  s.source_files  = "EasyUserDefault/Source/**/*.{h,m,swift}"
  s.swift_version = '3.3'

end
