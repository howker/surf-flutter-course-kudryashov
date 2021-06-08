class NetworkException implements Exception {
  NetworkException({
    this.responseName,
    this.exceptionName,
  });

  final String responseName;

  final String exceptionName;

  @override
  String toString() =>
      "В запросе $responseName возникла ошибка: $exceptionName";
}
