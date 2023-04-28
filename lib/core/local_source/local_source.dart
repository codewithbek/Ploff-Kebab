import 'package:hive/hive.dart';
import 'package:ploff_kebab/core/constants/constants.dart';

class LocalSource {
  final Box<dynamic> box;

  LocalSource(this.box);

  Future<void> clear() async {
    await box.clear();
    return;
  }

  void setPinCode(String locale) {
    box.put(AppKeys.pinCode, locale);
  }

  String get pinCode {
    return box.get(AppKeys.pinCode, defaultValue: "ru");
  }

  void setBio(bool locale) {
    box.put(AppKeys.biometrics, locale);
  }

  bool get hasBio {
    return box.get(AppKeys.biometrics, defaultValue: false);
  }

  void setLocale(String locale) {
    box.put(AppKeys.LOCALE, locale);
  }

  String getLocale() {
    return box.get(AppKeys.LOCALE, defaultValue: "ru");
  }

  void setAccessToken(String accessToken) {
    box.put(AppKeys.ACCESSTOKEN, accessToken);
  }

  String? getAccessToken() {
    return box.get(AppKeys.ACCESSTOKEN);
  }

  void setFirstName(String firstName) {
    box.put(AppKeys.FIRSTNAME, firstName);
  }

  String? getFirstName() {
    return box.get(AppKeys.FIRSTNAME);
  }

  void setEmail(String email) {
    box.put(AppKeys.EMAIL, email);
  }

  String? getEmail() {
    return box.get(AppKeys.EMAIL);
  }

  void setPassword(String password) {
    box.put(AppKeys.PASSWORD, password);
  }

  String? getPassword() {
    return box.get(AppKeys.PASSWORD);
  }

  void setProfile(bool auth) {
    box.put(AppKeys.hasProfile, auth);
  }

  bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);
}
