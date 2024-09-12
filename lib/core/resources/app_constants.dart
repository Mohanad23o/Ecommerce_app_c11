class AppConstants {
  AppConstants._();

  static const String welcomeBack = 'Welcome Back To Route';
  static const String confirmPassword = 'Confirm Password';
  static const String noInternet =
      'No Internet Connection , Check Internet And Try Again.';
  static const String signInWithMail = 'Please sign in with your mail';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String emailHintText = 'Enter Your Email';
  static const String passwordHintText = 'Enter Your Password';
  static const String forgotPassword = 'Forgot password';
  static const String login = 'Login';
  static const String haveNoAccount = 'Don’t have an account?';
  static const String createAccount = 'Create Account';
  static const String fullName = 'Full Name';
  static const String enterFullName = 'enter your full name';
  static const String enterPhone = 'enter your mobile no.';
  static const String phoneNumber = 'Mobile Number';
  static const String enterEmail = 'enter your email address';
  static const String category = 'Categories';
  static const String brand = 'Brands';
}

class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://ecommerce.routemisr.com';
  static const String signUpApi = '/api/v1/auth/signup';
  static const String brandsApi = '/api/v1/brands';
  static const String categoriesApi = '/api/v1/categories';
  static const String signInApi = '/api/v1/auth/signin';
  static const String productsApi = '/api/v1/products';
  static const String addToCartApi = '/api/v1/cart';
  static const String addToFavouritesApi = '/api/v1/wishlist';
}
