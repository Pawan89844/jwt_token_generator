<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A JWT token generator package for flutter and dart.

## Features

Generate HS256 algorithm jwt token.

## Getting started

Add the depency to pubspec.yaml and start using its methods.

## Usage

1. Instantiate JWT class.
2. Declare the payload.
3. Use generateToken method.

```dart
JWT jwt = JWT();
Map<String, dynamic> payload = {
    'iss': 'localhost',
    'exp': DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch / 1000,
    'id': 1,
    'fullname': 'User name'
};
String token = await jwt.generateToken(payload: payload, secretKey: 'SampleKey');
```

## Additional information

Currently supported algorithm: HS256
will be adding more algorithm soon or if you want to contribute you are welcome.

