import '../jwt_token_generator.dart';

class JWT with Algorithm implements Token {
  Map<String, dynamic> _userData = {};

  Map<String, dynamic> get jwtpayload => _userData;
  @override
  Future<bool> verifyTokey(
      {required String token, required String secretKey}) async {
    if (token.isNotEmpty && token != 'null') {
      List<String> splitToken = token.split('.');
      String encodedHeader = splitToken[0].trim();
      String encodedPayload = splitToken[1].trim();
      String encodedSignature = splitToken[2].trim();
      Uint8List decodedHeader = base64Url.decode(encodedHeader);
      Uint8List decodedPayload = base64Url.decode(encodedPayload);
      String utf8Payload = utf8.decode(decodedPayload);
      Map<String, dynamic> payload = json.decode(utf8Payload);
      _userData = payload;
      List<int> combinedUTF8 = decodedHeader + decodedPayload;
      var hmac = Hmac.sha256();
      var p = await hmac.calculateMac(combinedUTF8,
          secretKey: SecretKey(secretKey.codeUnits));
      var newP = await hmac.hashAlgorithm.hash(p.bytes);
      var encode = base64Url.encode(newP.bytes);
      return encode == encodedSignature;
    } else {
      return false;
    }
  }

  @override
  Future<String> generateToken(
      {required Map<String, dynamic> payload,
      required String secretKey}) async {
    String jsonEncodedHeader = jsonEncode(header());
    String jsonEncodedPayload = jsonEncode(payload);
    List<int> utf8Header = utf8.encode(jsonEncodedHeader);
    List<int> utf8Payload = utf8.encode(jsonEncodedPayload);
    String encodedHeader = base64Url.encode(utf8Header);
    String encodedPayload = base64Url.encode(utf8Payload);
    List<int> combinedUTF8 = utf8Header + utf8Payload;
    var hmac = Hmac.sha256();
    var p = await hmac.calculateMac(combinedUTF8,
        secretKey: SecretKey(secretKey.codeUnits));
    var newP = await hmac.hashAlgorithm.hash(p.bytes);
    var encode = base64Url.encode(newP.bytes);
    String jwt = '$encodedHeader.$encodedPayload.$encode';
    return jwt;
  }
}
