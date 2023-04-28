import '../../injector_container.dart';
import '../local_source/local_source.dart';

mixin CacheMixin {
  final localSource = sl<LocalSource>();

  void setUserInfo({
    required String firstName,
    required String phone,
    required String password,
    required String token,
  }) {
    localSource.setFirstName(firstName);
    localSource.setEmail(phone);
    localSource.setPassword(password);
    localSource.setAccessToken(token);
  }
}
