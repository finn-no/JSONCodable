Pod::Spec.new do |s|
    s.name             = 'JSONCodable'
    s.summary          = 'Type-safe Codable wrapper for all basic JSON types'
    s.version          = '1.0.0'
    s.author           = 'FINN.no'
    s.homepage         = 'https://github.com/finn-no/JSONCodable'
    s.social_media_url = 'https://twitter.com/FINN_tech'
    s.description      = 'JSONCodable is a lightweight library with for decoding/encoding all basic JSON types in a type-safe manner.'
    s.license          = 'MIT'
    s.platform         = :ios, '11.2'
    s.requires_arc     = true
    s.swift_version    = '5.0'
    s.source           = { :git => 'https://github.com/finn-no/JSONCodable.git', :tag => s.version }
    s.cocoapods_version = '>= 1.4.0'
    s.source_files = 'Sources/*.{h,m,swift}'
    s.frameworks = 'Foundation', 'UIKit'
  end
