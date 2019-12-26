class RequestException implements Exception {
  String _message;

  RequestException(this._message);

  @override
  String toString() {
    // TODO: implement toString
    return "Exception : $_message";
  }
}



