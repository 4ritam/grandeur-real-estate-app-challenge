import '../../config/typedefs/typedefs.dart';
import 'package:appwrite/models.dart';

abstract class AuthService {
  FutureEither<Session> login(String email, String password);

  FutureEither<User> signup(String email, String password, String name);

  FutureEither<void> logout();

  FutureEither<void> forgotPassword(String email);

  FutureEither<void> updatePassword(String password, String newPassword);
}
