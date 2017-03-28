Pod::Spec.new do |s|
  s.name     = 'SVProgressHUD-BM'
  s.version  = '0.0.2'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.license  =  { :type => 'MIT', :file => 'LICENSE.txt' }
  s.summary  = 'Instance support for SVProgressHUD using for view base on v2.1.2'
  s.homepage = 'https://github.com/zhengbomo/SVProgressHUD-BM'
  s.authors   = { 'bomo' => 'zhengbomo@hotmail.com' }
  s.source   = { :git => 'https://github.com/zhengbomo/SVProgressHUD-BM.git', :tag => s.version }
  s.description = 'SVProgressHUD is a clean and easy-to-use HUD meant to display the progress of an ongoing task on iOS and tvOS. The success and error icons are from Freepik from Flaticon and are licensed under Creative Commons BY 3.0.'
  s.source_files = 'SVProgressHUD/*.{h,m}'
  s.framework    = 'QuartzCore'
  s.resources    = 'SVProgressHUD/SVProgressHUD.bundle'
  s.requires_arc = true

end
