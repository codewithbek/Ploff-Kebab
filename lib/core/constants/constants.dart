class Constants {
  static const baseUrl = 'https://test.customer.api.delever.uz';
  static const shipperId = 'd4b1658f-3271-4973-8591-98a82939a664';
  static const imageUrl = 'https://test.cdn.delever.uz/delever/';
  static const iosPlatformID = "f6631db7-09d0-4cd9-a03a-b7a590abb8c1";
  static const androidPlatformID = "6bd7c2e3-d35e-47df-93ce-ed54ed53f95f";
}

class Validations {
  static const PHONE_EMPTY = 'Phone cannot be empty';
  static const NOT_PHONE = 'This is not phone';
  static const PASSWORD_EMPTY = 'Password cannot be empty';
  static const PASSWORD_SHORT = 'Password too short';
  static const PASSWORD_LONG = 'Password too long';
  static const NAME_EMPTY = 'Name cannot be empty';
  static const NAME_SHORT = 'Name too short';
  static const NAME_LONG = 'Name too long';
  static const PASSWORD_NOT_MATCH = 'Passwords do not match';
  static const INTERNET_FAILURE = 'No Internet';
  static const SOMETHING_WENT_WRONG = 'Something went wrong!';
}

class AppKeys {
  static const LOCALE = 'locale';
  static const FCM_TOKEN = 'fcm_token';
  static const ACCESS_TOKEN = 'access_token';
  static const REFRESH_TOKEN = 'refresh_token';

  static const NAME = 'name';
  static const PHONE = 'phone';
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
  static const SIGN_IN_URL = '/v1/customers/login';
  static const SIGN_UP_URL = '/v1/customers/register';
  static const CUSTOMERS_PHONE = '/v1/customers/phone';
  static const REGISTER_CONFIRM = '/v1/customers/register-confirm';
  static const LOGIN_CONFIRM = '/v1/customers/confirm-login';

  static const GET_CATEGORIES_WITH_PRODUCTS_URL = '/v2/category-with-products';
  static const GET_BANNER_URL = '/v1/banner';

  static const SEARCH_PRODUCT = '/v2/product';
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
