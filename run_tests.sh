set -e

xcodebuild ONLY_ACTIVE_ARCH=NO -workspace kcdcios.xcworkspace -scheme kcdciosSpecs -configuration Debug -sdk iphonesimulator
