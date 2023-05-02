import '../../injector_container.dart';
import '../local_source/local_source.dart';

mixin CacheMixin {
  final localSource = sl<LocalSource>();

  void setUserPhoneNumber({
    required String phone,
  }) {
    localSource.setPhone(phone);
  }

  void setUserInfo({
    required String name,
    required String phone,
    // required String token,
  }) {
    localSource.setName(name);
    localSource.setPhone(phone);
    // localSource.setAccessToken(token);
  }

  void setName({
    required String name,
  }) {
    localSource.setName(name);
  }
}
