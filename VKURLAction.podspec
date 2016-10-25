#
# Be sure to run `pod lib lint VKURLAction.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VKURLAction'
  s.version          = '1.0.0'
  s.summary          = 'The actual author of this pod will have to fill this in'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The actual author of this pod will have to fill this in to include a detailed description of this pod.
                       DESC

  s.homepage         = 'https://github.com/Awhisper/VKURLAction'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Awhisper' => '65301524@qq.com' }
  s.source           = { :git => 'https://github.com/Awhisper/VKURLAction.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'VKURLAction/**/*'

end
