// // ignore_for_file: depend_on_referenced_packages

// import 'package:betaworkapp/modules/authentication/domains/entities/token.entity.dart';
// import 'package:hive/hive.dart';

// import '../domains/models/request_response_model.dart';
// import 'base_repository.dart';

// class TokenRepository extends BaseRepository {
//   @override
//   Future<RequestRes> showError(String error) async {
//     return RequestRes(
//       error: ErrorRes(message: error),
//     );
//   }

//   Future<Box<TokenEntity>> get _tokenBox async {
//     final box = await Hive.openBox<TokenEntity>(TokenEntity.tableName);
//     return box;
//   }

//   Future<TokenEntity?> getTokens() async {
//     final box = await _tokenBox;
//     return box.get(TokenEntity.localId);
//   }

//   Future<TokenEntity?> setTokens({
//     required Map<String, dynamic> userData,
//   }) async {
//     // ignore: unused_local_variable
//     final oldToken = await getTokens();

//     final TokenEntity newTokenData = TokenEntity(
//       tokenData: userData,
//       uuid: userData['access_token']['AuthenticationResult']["TokenType"],
//     );
//     final box = await _tokenBox;
//     await box.put(TokenEntity.localId, newTokenData);
//     return newTokenData;
//   }

//   @override
//   Future<void> clear() async {
//     await _tokenBox.then((box) => box.clear());
//   }
// }
