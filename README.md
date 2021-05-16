# Jenkins Manager

[![Codemagic](https://api.codemagic.io/apps/60927ef51061817f02ea203f/60927ef51061817f02ea203e/status_badge.svg)](https://codemagic.io/apps/60927ef51061817f02ea203f/60927ef51061817f02ea203e/latest_build)

## About

App for managing some Jenkins actions.

## Feedback

Right now the project in a development state. If you have an issue or advice please tell about it [here](https://github.com/fartem/jenkins-manager/issues).

## Before build

Before build you need to generate `locator` (DI) and `routes` (navigation entitites) for project. Run from a shell:

```shell
flutter pub run build_runner build
```

## How to build app for Android

Soon.

## How to build app for iOS

Soon.

## How to build app for Linux

Soon.

## How to contribute

Read [Commit Convention](https://github.com/fartem/repository-rules/blob/master/commit-convention/COMMIT_CONVENTION.md). Make sure your build is green before you contribute your pull request. Then:

```shell
$ flutter pub global activate dart_enum_to_string_check
$ flutter pub global run dart_enum_to_string_check
$ flutter pub global activate dart_code_metrics
$ flutter pub global run dart_code_metrics:metrics lib
$ flutter analyze
```

## Contributors

- [@fartem](https://github.com/fartem) as Artem Fomchenkov
