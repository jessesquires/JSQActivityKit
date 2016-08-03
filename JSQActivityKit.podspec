Pod::Spec.new do |s|
   s.name = 'JSQActivityKit'
   s.version = '1.0.2'
   s.license = 'MIT'

   s.summary = 'Swift UIActivities for iOS'
   s.homepage = 'https://github.com/jessesquires/JSQActivityKit'
   s.documentation_url = 'http://jessesquires.com/JSQActivityKit'

   s.social_media_url = 'https://twitter.com/jesse_squires'
   s.authors = { 'Jesse Squires' => 'jesse.squires.developer@gmail.com' }

   s.source = { :git => 'https://github.com/jessesquires/JSQActivityKit.git', :tag => s.version }
   s.source_files = 'JSQActivityKit/JSQActivityKit/*.swift'
   s.resources = 'JSQActivityKit/JSQActivityKit/*.xcassets'

   s.platform = :ios, '8.0'
   s.frameworks = 'UIKit'
   s.requires_arc = true
end
