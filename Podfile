# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
def quickDB
  pod 'QuickDB', :git => 'https://github.com/behrad-kzm/QuickDB'
end

target 'ListHub' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Hero'
  pod 'Stellar', :git => 'https://github.com/AugustRush/Stellar.git'
  pod 'BEKListKit'
  pod 'SDWebImage'
  pod "SwiftRater"
  pod 'Siren'
  pod 'IQKeyboardManagerSwift'
  pod 'Instructions'
  
  # Pods for Domain
  target 'Domain' do
    quickDB
  end
  
  # Pods for DatabaseManager
  target 'DatabaseManager' do
    quickDB
  end
end
