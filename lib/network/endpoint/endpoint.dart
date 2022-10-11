class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://localhost:3001";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // user
  static const String createUser = baseUrl + "/user";

  // transaction
  static const String transactionUrl = baseUrl + "/transaction";

  static const String createTransaction = transactionUrl;
  static const String getAllTransaction = transactionUrl + "/all";
  static const String getOneTransaction = transactionUrl;
  static const String updateTransaction = transactionUrl;
  static const String deleteTransaction = transactionUrl;
}
