class ApiSettings{
  static const _baseUrl = "https://smart-store.mr-dev.tech/api/";
  static const login = "${_baseUrl}auth/login";
  static const register = "${_baseUrl}auth/register";
  static const activate = "${_baseUrl}auth/activate";
  static const logout = "${_baseUrl}auth/logout";
  static const forgetPassword = "${_baseUrl}auth/forget-password";
  static const changePassword = "${_baseUrl}auth/change-password";
  static const resetPassword = "${_baseUrl}auth/reset-password";
  static const updateProfile = "${_baseUrl}auth/update-profile";


  static const categories = "${_baseUrl}categories/{id}";

  static const readProducts = "${_baseUrl}sub-categories/{id}";
  static const productDetails = "${_baseUrl}products/{id}";
  static const home = "${_baseUrl}home";
  static const offers = "${_baseUrl}offers";

  static const favoriteProducts = "${_baseUrl}favorite-products";
  static const rateProduct = "${_baseUrl}products/rate";

  static const cities = "${_baseUrl}cities";

  static const addresses = "${_baseUrl}addresses/{id}";

  static const paymentCards = "${_baseUrl}payment-cards/{id}";

  static const orders = "${_baseUrl}orders/{id}";

  static const faqs = "${_baseUrl}faqs";

  static const apiKey = "ea149cc7-34ac-4327-8505-4cc5d632d3d7";
}