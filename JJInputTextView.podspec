Pod::Spec.new do |s|

s.name = 'JJInputTextView'
s.version = '0.0.1'
s.platform = :ios, '7.0'
s.summary = '自带提示文字，可自动换行计算高度，实现聊天输入框样式'
s.homepage = 'https://github.com/andyfangjunjie/JJInputTextView'
s.license = 'MIT'
s.author = { 'andyfangjunjie' => 'andyfangjunjie@163.com' }
s.source = {:git => 'https://github.com/andyfangjunjie/JJInputTextView.git', :tag => s.version}
s.source_files = 'JJInputTextView/**/*.{h,m}'
s.requires_arc = true
s.framework  = 'UIKit'

end
