import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grandeur/config/typedefs/typedefs.dart';
import 'package:grandeur/core/providers/providers.dart';
import 'package:grandeur/core/services/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/failure.dart';

final authRemoteApiProvider = Provider<AuthRemoteApi>(
  (ref) {
    final account = ref.watch(appwriteAccountProvider);
    return AuthRemoteApi(account: account);
  },
  name: 'Auth Remote Api',
);

class AuthRemoteApi implements AuthService {
  final Account _account;

  const AuthRemoteApi({required Account account}) : _account = account;

  @override
  FutureEither<User> signup(String email, String password, String name) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      return right(account);
    } on AppwriteException catch (e, s) {
      try {
        return left(Failure(
          e.response["message"].toString().split(":")[1].trim(),
          s,
        ));
      } catch (error) {
        return left(
          Failure(
            e.response["message"].toString(),
            s,
          ),
        );
      }
    } catch (e, s) {
      return Left(Failure(e.toString(), s));
    }
  }

  @override
  FutureEither<Session> login(String email, String password) async {
    try {
      final session = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(session);
    } on AppwriteException catch (e, s) {
      try {
        return left(Failure(
          e.response["message"].toString().split(":")[1].trim(),
          s,
        ));
      } catch (error) {
        return left(
          Failure(
            e.response["message"].toString(),
            s,
          ),
        );
      }
    } catch (e, s) {
      return Left(Failure(e.toString(), s));
    }
  }

  @override
  FutureEither<void> logout() async {
    try {
      await _account.deleteSessions();
      return const Right(null);
    } on AppwriteException catch (e, s) {
      try {
        return left(Failure(
          e.response["message"].toString().split(":")[1].trim(),
          s,
        ));
      } catch (error) {
        return left(
          Failure(
            e.response["message"].toString(),
            s,
          ),
        );
      }
    } catch (e, s) {
      return Left(Failure(e.toString(), s));
    }
  }

  @override
  FutureEither<void> forgotPassword(String email) {
    throw UnimplementedError();
  }

  @override
  FutureEither<void> updatePassword(String password, String newPassword) {
    throw UnimplementedError();
  }
}
