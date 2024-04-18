import 'package:jwt_token_generator/src/jwt.dart';

void main() async {
  JWT jwt = JWT();
  Map<String, dynamic> payload = {
    'iss': 'localhost',
    'exp': DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch / 1000,
    'id': 1,
    'fullname': 'User name'
  };
  String token =
      await jwt.generateToken(payload: payload, secretKey: 'SampleKey');
  print('Token : $token');
}
