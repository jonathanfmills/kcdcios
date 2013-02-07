set -e

xcodebuild ONLY_ACTIVE_ARCH=NO -workspace kcdcios.xcworkspace -scheme kcdcios -configuration Debug -sdk iphonesimulator clean build