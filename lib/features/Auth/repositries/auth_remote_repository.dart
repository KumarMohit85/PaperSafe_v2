import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:paper_safe_v2/core/failure/failure.dart';
import 'package:paper_safe_v2/core/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://papersafe.onrender.com', // Replace with your API base URL
      connectTimeout: Duration(seconds: 300), // 5 minutes
      receiveTimeout: Duration(seconds: 300), // 5 minutes
    ),
  );

  return AuthRemoteRepository(dio: dio);
}

class AuthRemoteRepository {
  final Dio dio;
  AuthRemoteRepository({required this.dio});
  Future<Either<Failure, UserModel>> RegisterUser(
      {required String firstName,
      required String lastName,
      required String mobileNumber,
      required String emailId,
      required String dob,
      required String gender}) async {
    try {
      final data = {
        'firstName': firstName,
        'lastName': lastName,
        'mobileNumber': mobileNumber,
        'emailID': emailId,
        'dob': dob,
        'gender': gender,
      };
      print(data);

      final response = await dio.post('/api/v1/register', data: data);
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = UserModel.fromMap(response.data['data']);
        return Right(user);
      } else {
        return Left(
            Failure('Failed to register user: ${response.statusMessage}'));
      }
    } catch (e) {
      return Left(Failure('An error occurred: $e'));
    }
  }
}
