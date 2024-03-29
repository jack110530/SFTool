#
# Be sure to run `pod lib lint SFTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SFTool'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SFTool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jack110530/SFTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jack110530' => 'hsf_ios@sina.com' }
  s.source           = { :git => 'https://github.com/jack110530/SFTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SFTool/Classes/SFTool.h'
  s.public_header_files = 'SFTool/Classes/SFTool.h'
  

  # SFPhotoPicker
  s.subspec 'SFPhotoPicker' do |ss|
    ss.source_files = 'SFTool/Classes/SFPhotoPicker/*.{h,m}'
  end

  # SFCleanCacheTool
  s.subspec 'SFCleanCacheTool' do |ss|
    ss.source_files = 'SFTool/Classes/SFCleanCacheTool/*.{h,m}'
  end
  
  # SFThreadTool
  s.subspec 'SFThreadTool' do |ss|
    ss.source_files = 'SFTool/Classes/SFThreadTool/*.{h,m}'
  end

  
  # s.resource_bundles = {
  #   'SFTool' => ['SFTool/Assets/*.png']
  # }

  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'Masonry'
  s.dependency 'SFCategory'
  s.dependency 'SFMacro'
  s.dependency 'SFCrashInspector'

  
end
