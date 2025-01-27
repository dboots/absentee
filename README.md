# absentee.bid
# build android
flutter build apk --dart-define-from-file=.env
# build ios
flutter build ipa --dart-define-from-file=.env
# generate model using freezed package
`dart run build_runner build --delete-conflicting-outputs`
