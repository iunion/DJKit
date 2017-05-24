Pod::Spec.new do |s|
  s.name        = 'DJKit'
  s.summary     = 'DJKit is a collection of useful classes to develop Apps faster.'
  s.version     = '1.0.4'
  s.authors     = { 'Dennis Deng' => 'iunion@live.cn' }
  s.homepage    = 'https://github.com/iunion/DJKit'
  s.source      = { :git => 'https://github.com/iunion/DJKit.git', :tag => s.version.to_s }
  s.license     = { :type => 'MIT', :file => 'LICENSE' }

  s.platform    = :ios, '7.0'
  s.requires_arc    = true

  s.source_files    = 'DJKit/**/*.{h,m}'
  s.public_header_files = 'DJKit/**/*.h'
  s.prefix_header_contents = '#import <DJKit/DJKit.h>'
  s.resources = ['DJKit/DJKit/**/*.png']

  s.frameworks  = 'Foundation', 'UIKit'
  s.libraries   = 'z'

  s.ios.deployment_target = '7.0'

  s.dependency 'SDWebImage', '~> 4.0.0'

end
