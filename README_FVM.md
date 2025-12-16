# FVM setup

This project is configured to use FVM (Flutter Version Management).

## Prerequisites

- Install FVM: https://fvm.app/

## Use the project Flutter version

```sh
fvm use 3.27.4 --force
```

This creates the `.fvm/flutter_sdk` symlink used by VS Code.

## VS Code

- The workspace sets `dart.flutterSdkPath` to `.fvm/flutter_sdk` in `.vscode/settings.json`.
- Launch configurations are available in `.vscode/launch.json`.

## Common tasks (FVM)

```sh
# Generate Intl files
fvm dart pub global run intl_utils:generate

# Generate Freezed/JSON code
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
fvm flutter run
```
