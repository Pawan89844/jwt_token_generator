mixin Algorithm {
  String algorithm = 'HS256';

  Map<String, dynamic> header() {
    return {'alg': algorithm, 'typ': 'JWT'};
  }
}
