class Constants {
  static const baseUrl = 'https://test.customer.api.delever.uz';
  static const shipperId = 'd4b1658f-3271-4973-8591-98a82939a664';
  static const imageUrl = 'https://test.cdn.delever.uz/delever/';
  static const iosPlatformID = "f6631db7-09d0-4cd9-a03a-b7a590abb8c1";
  static const androidPlatformID = "6bd7c2e3-d35e-47df-93ce-ed54ed53f95f";
}

class Validations {
  static const EMAIL_EMPTY = 'Email cannot be empty';
  static const NOT_EMAIL = 'This is not email';
  static const PASSWORD_EMPTY = 'Password cannot be empty';
  static const PASSWORD_SHORT = 'Password too short';
  static const PASSWORD_LONG = 'Password too long';
  static const FIRSTNAME_EMPTY = 'Firstname cannot be empty';
  static const FIRSTNAME_SHORT = 'Firstname too short';
  static const FIRSTNAME_LONG = 'Firstname too long';
  static const LASTNAME_EMPTY = 'Last name cannot be empty';
  static const LASTNAME_SHORT = 'Lastname too short';
  static const LASTNAME_LONG = 'Lastname too long';
  static const PASSWORD_NOT_MATCH = 'Passwords do not match';
  static const INTERNET_FAILURE = 'No Internet';
  static const SOMETHING_WENT_WRONG = 'Something went wrong!';
}

class AppKeys {
  static const LOCALE = 'locale';
  static const ACCESSTOKEN = 'fcm_token';
  static const FIRSTNAME = 'firstname';
  static const EMAIL = 'email';
  static const PASSWORD = 'password';
  static const pinCode = 'pincode';
  static const biometrics = 'biometrics';
  static const hasProfile = 'auth';
}

class CacheKeys {
  static const String countries = 'countries';
  static const String lounge = 'lounge';
  static const String hall = 'hall';
}

class Urls {
  static const SIGN_IN_URL = '/v1/customers/login/';
  static const SIGN_UP_URL = '/v1/customers/register/';
  static const CUSTOMERS_PHONE = '/v1/customers/phone';
  static const REGISTER_CONFIRM = '/v1/customers/register-confirm';
  static const LOGIN_CONFIRM = '/v1/customers/confirm-login';

  static const GET_CATEGORIES_WITH_PRODUCTS_URL = '/v2/category-with-products/';
  static const GET_BANNER_URL = '/v1/banner/';
  static const GET_OBJECT = '/v1/object/';
}

class DatabaseKeys {
  static const featuredList = 'featured_list';
  static const countryList = 'get-list';
}

class TableSlugs {
  static const String counrty = '/country';
  static const String place = '/place';
  static const String placeGallery = '/place_gallery';
}
