import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:paper_safe_v2/core/models/user_model.dart';
import 'package:paper_safe_v2/features/Auth/repositries/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;

  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    return null;
  }

  Future<void> SignUpUser(
      {required String firstName,
      required String lastName,
      required String mobileNumber,
      required String emailId,
      required String dob,
      required String gender}) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.RegisterUser(
        firstName: firstName,
        lastName: lastName,
        mobileNumber: mobileNumber,
        emailId: emailId,
        dob: dob,
        gender: gender);

    //  final user = await res;
    //   user.fold(
    //     (l) => state = AsyncValue.error(l,StackTrace.current),
    //     (r) => state = AsyncValue.data(r),
    //   );

    final val = switch (await res) {
      Left(value: final l) => state =
          AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => state = AsyncValue.data(r)
    };

    print(val);
  }
}
