abstract class Token {
  Future<String> generateToken(
      {required Map<String, dynamic> payload, required String secretKey});
  Future<bool> verifyTokey({required String token, required String secretKey});
}
