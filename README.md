# publican [![Pub Package](https://img.shields.io/pub/v/publican.svg)](https://pub.dartlang.org/packages/publican) [![Build Status](https://travis-ci.org/leocavalcante/publican.svg?branch=master)](https://travis-ci.org/leocavalcante/publican)

🧔 The package that will help you out with Dart's Pub 🎯

## Getting started

Bring **publican** to your global dependencies:

```shell
pub global activate publican
```

## Commands

- [publican init](#publican-init)
- [publican add](#publican-add)

##### [I have an idea for a command](https://github.com/leocavalcante/publican/issues)

## Documentation

### `publican init`

Initializes a `pubspec.yaml` file.

```shell
mkdir my_awesome_app
cd  my_awesome_app
publican init
```

It will generate a `pubspec.yaml` file with the following defaults:

```yaml
name: my_app
version: 0.1.0
description: My awesome Dart app
```

You can override default values throught the options:

```shell
-n, --name           (defaults to "my_app")
-v, --version        (defaults to "0.1.0")
-d, --description    (defaults to "My awesome Dart app")
```

_Note: it will not override your current pubspec.yaml file, if you already have one, its safe._

### `publican add`

Adds a dependency to `pubspec.yaml` file.

```shell
publican add angular angular_components
```

Publican will already look for the latest stable version:

```yaml
name: my_app
version: 0.1.0
description: My awesome Dart app

dependencies:
  angular_components: ^0.8.0
  angular: ^4.0.0+2
```

⚠️ **Also, it will not change your previous YAML structure definitions, that is a key difference from Publican to other similar packages.**

The `--dev` flag will add the dependencies to `dev_dependencies` key

```shell
publican add --dev build_runner build_web_compilers
```

```yaml
name: my_app
version: 0.1.0
description: My awesome Dart app

dependencies:
  angular_components: ^0.8.0
  angular: ^4.0.0+2

dev_dependencies:
  build_web_compilers: ^0.3.4+2
  build_runner: ^0.8.0
```

If you are not sure about the output, you can check it out before by adding the `--dry-run` flag, then it will print out what it would write.

You can also constraint a dependency to a specific version using an `@` symbol:

```shell
publican add angular@^1.1.2+2
```

---

BSD 3-Clause License

Copyright (c) 2018, Leo Cavalcante
All rights reserved.
