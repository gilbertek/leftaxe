---
title: "React Native With Mapview"
date: 2018-01-06T20:26:37-05:00
draft: true
---
Integrate a map into a react-native application

The instruction is here, but here's a concise version for iOS.
https://github.com/react-community/react-native-maps/blob/master/docs/installation.md#on-ios

{{< highlight bash >}}
react-native init mappd

cd mappd

react-native run-ios

yarn add react-native-maps


{{< /highlight >}}

Manage iOS version with CocoaPods

Follow installation instruction on their site
https://guides.cocoapods.org/using/getting-started.html

{{< highlight bash >}}
cd ios

pod init

vim Podfile


{{< /highlight >}}

replace your Podfile with this after `target 'mappd'` :


{{< highlight ruby >}}

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'mappd' do
# Uncomment the next line if you're using Swift or would like to use dynamic frameworks
# use_frameworks!

# Pods for GetStarted
  rn_path = '../node_modules/react-native'

  pod 'yoga', path: "#{rn_path}/ReactCommon/yoga/yoga.podspec"
  pod 'React', path: rn_path, subspecs: %w[
    Core
    RCTActionSheet
    RCTAnimation
    RCTGeolocation
    RCTImage
    RCTLinkingIOS
    RCTNetwork
    RCTSettings
    RCTText
    RCTVibration
    RCTWebSocket
    BatchedBridge
  ]

  # pod 'GoogleMaps'  # Remove this line if you don't want to support GoogleMaps on iOS
  pod 'react-native-maps', path: '../node_modules/react-native-maps'
  # pod 'react-native-google-maps', path: '../node_modules/react-native-maps'  # If you need GoogleMaps support on iOS
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'react-native-google-maps'
      target.build_configurations.each do |config|
        config.build_settings['CLANG_ENABLE_MODULES'] = 'No'
      end
    end

    if target.name == 'React'
      target.remove_from_project
    end
  end
end

{{< /highlight >}}

