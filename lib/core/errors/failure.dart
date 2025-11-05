class Failure implements Exception {
  final String errorMsg;
  Failure({this.errorMsg = "Unexpected Error Occurred!"});
}