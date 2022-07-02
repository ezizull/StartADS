
# ADS Flutter Aps Starter

This project uses FVM for manage versions

[Read the FVM documentation](https://fvm.app)

flutter SDK Version : 2.10.3

Note : Jika versi flutter teman-teman sudah sama maka tidak perlu menginstall fvm

## Extension VsCode

1. bloc
2. Dart
3. Flutter
4. GitLens (Bisa digunakan untuk melihat siapa yang melakukan commit per barisnya)

## Start Server

### Mobile
```sh
# without fvm
flutter run
```
```sh
# with fvm
fvm flutter run
```

### Web
```sh
# without fvm
flutter run -d <browser use>
```
```sh
# with fvm
fvm flutter run -d <browser use>
```


## Build APK & ABB & WEB

```sh
# for mobile (.apk)
fvm flutter build apk 
```
```sh
# for mobile (.aab)
fvm flutter build appbundle 
```
```sh
# for web
fvm flutter build web 
```
