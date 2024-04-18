import 'package:jwt_token_generator/src/jwt.dart';
import 'package:test/test.dart';

void main() async {
  JWT jwt = JWT();
  String token =
      await jwt.generateToken(payload: _payload, secretKey: 'SAMPLEKEY');
  bool isValid = await jwt.verifyTokey(token: token, secretKey: 'SAMPLEKEY');
  test('JWT Token Generator test', () {
    bool isTokenGenerated = token.isNotEmpty;
    expect(isTokenGenerated, true);
  });
  test('Verify token', () {
    expect(isValid, true);
  });
}

Map<String, dynamic> _payload = {
  'iss': 'localhost',
  'exp': DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch / 1000,
  'id': 1,
  'fullname': 'Pawan Kumar'
};
