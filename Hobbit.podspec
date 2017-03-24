Pod::Spec.new do |s|
    s.name             = 'Hobbit'
    s.version          = '0.1.0'
    s.summary          = 'Tools for working with bits in Swift'
    s.homepage         = 'https://github.com/sadawi/Hobbit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Sam Williams' => 'samuel.williams@gmail.com' }
    s.source           = { :git => 'https://github.com/sadawi/Hobbit.git', :tag => s.version.to_s }
    
    s.platforms       = { :ios => '9.0' }
    
    s.source_files = 'Hobbit/Classes/**/*'
end
