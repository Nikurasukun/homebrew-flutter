# Homebrew Flutter 

Super-easy two-step [Flutter](https://flutter.dev) installation with [Homebrew](https://brew.sh) :sunglasses:

This will install the latest [master|dev|beta|stable] version of the framework directly from Google's servers.

Afterwards you can simply use `flutter channel [master|dev|beta|stable]` to switch between the different channels and `flutter upgrade` to upgarde to the latest version in the currently selected channel :cocktail:

## Installing

### macOS
```
brew tap nikurasukun/flutter
brew install flutter-macos
```

### Linux
```
brew tap nikurasukun/flutter
brew install flutter-linux
```

And voilà! You're done :tada:

FYI: You will find your Flutter installation here: `/usr/local/Cellar/flutter/sdk`.

## Uninstalling
```
brew uninstall flutter-macos flutter-linux
brew untap nikurasukun/flutter
```

That's already it :put_litter_in_its_place:

## Contributors

- [dancamdev](https://github.com/dancamdev) - Added channel selection :wrench:
- [passsy](https://github.com/passsy) - Tester & proofreading :eyeglasses:
