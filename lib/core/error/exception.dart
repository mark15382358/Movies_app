import 'package:movies_app/core/utils/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServerException({required this.errorMessageModel});
}
class  LocalDataBaseException implements Exception{
    final ErrorMessageModel errorMessageModel;
  LocalDataBaseException({required this.errorMessageModel});
}