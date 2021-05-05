# Jenkins Manager

## About

App for managing some Jenkins services.

## Feedback

Right now the project in a development state. If you have an issue or advice please tell about it [here](https://github.com/fartem/jenkins-manager/issues).

## Before build

Before build you need to generate `locator` (DI) and `routes` (navigation entitites) for project. Run from a shell:

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

## How to build app for Android

Soon.

## How to build app for iOS

Soon.

## How to contribute

Read [Commit Convention](https://github.com/fartem/repository-rules/blob/master/commit-convention/COMMIT_CONVENTION.md). Make sure your build is green before you contribute your pull request. Then:

```shell
$ flutter analyze
```

## Contributors

- [@fartem](https://github.com/fartem) as Artem Fomchenkov
