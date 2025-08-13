abstract class Failure {
  final String? title;
  final int? codeError;
  final String? message;

  const Failure({this.title, this.message, this.codeError});
}


class ServerFailure extends Failure {
  const ServerFailure(this.statusCode) : super();

  final int statusCode;
}