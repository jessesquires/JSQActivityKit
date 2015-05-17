Pod::Spec.new do |s|
   s.name = 'JSQActivityKit'
   s.version = '1.0.0'
   s.license = 'MIT'
   
   s.summary = 'Swift UIActivities for iOS'
   s.homepage = 'https://github.com/jessesquires/JSQActivityKit'
   s.social_media_url = 'https://twitter.com/jesse_squires'
   s.authors = { 'Jesse Squires' => 'jesse.squires.developer@gmail.com' }

   s.source = { :git => 'https://github.com/jessesquires/JSQActivityKit.git', :tag => s.version }

   s.platform = :ios, '8.0'

   s.source_files = 'JSQActivityKit/JSQActivityKit/*.swift'
   
   s.frameworks = 'UIKit'

   s.requires_arc = true
end
