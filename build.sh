set -e
# Old xcode build
# xcodebuild ONLY_ACTIVE_ARCH=NO -workspace kcdcios.xcworkspace -scheme kcdcios -configuration Debug -sdk iphonesimulator clean build

# new Shezhen build
ipa build && ipa distribute:testflight -a 885c081ddec0ac11fed18eab82b3cec0_ODY1ODczMjAxMy0wMi0wNSAxODoxMToyOC44MDY1MDk -t 099585f723ea28486965550153d4bce4_MTgzODMzMjAxMy0wMi0wNSAxODoxMjoyOC42NTk1MjM