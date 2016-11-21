Pod::Spec.new do |s|
    s.name         = 'TDCCommonCategory'
    s.version      = '1.0.1'
    s.summary      = 'An easy way to use category'
    s.homepage     = 'https://github.com/coderCX/TDCCommonCategory'
    s.license      = 'MIT'
    s.authors      = {'程曦' => '460018082@qq.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/coderCX/TDCCommonCategory.git', :tag => s.version}
    s.source_files = 'TDCCommonCategory/**/*.{h,m}'
    s.resource     = 'TDCCommonCategory/*'
    s.requires_arc = true
end
