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
    box.put(AppKeys.ACCESS_TOKEN, accessToken);
  }

  String? getAccessToken() {
    return box.get(AppKeys.ACCESS_TOKEN);
  }

  void setName(String firstName) {
    box.put(AppKeys.NAME, firstName);
  }

  String? getName() {
    return box.get(AppKeys.NAME);
  }

  void setPhone(String phone) {
    box.put(AppKeys.PHONE, phone);
  }

  String? getPhone() {
    return box.get(AppKeys.PHONE);
  }

  void setProfile(bool auth) {
    box.put(AppKeys.hasProfile, auth);
  }

  bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);
}
