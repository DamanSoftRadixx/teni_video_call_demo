class AppStrings {
  AppStrings._();
  static const String appName = "Demo Appliction";
  static const String loading = "Loading...";

  // Localization
  // For use AppStrings.appName.getString(context);
  static const Map<String, dynamic> EN = {appName: 'Demo Application'};
  static const Map<String, dynamic> KM = {appName: 'KM Demo Application'};
  static const Map<String, dynamic> JA = {appName: 'JA Demo Application'};
}

// Error Strings
class ErrorStrings {
  static const String thisFieldIsRequired = "This field is required";
  //Api call error
  static const cancelRequest = "Request to API server was cancelled";
  static const connectionTimeOut = "Connection timeout with API server";
  static const receiveTimeOut = "Receive timeout in connection with API server";
  static const sendTimeOut = "Send timeout in connection with API server";
  static const socketException = "Check your internet connection";
  static const unknownError = "Something went wrong";
  static const duplicateEmail = "Email has already been taken";
  static const parsingError = "Parsing error";
  static const String nullResponse = "No data found in response";

  //Status code
  // static const badRequest = "Bad request";
  // static const unauthorized = "Unauthorized";
  // static const forbidden = "Forbidden";
  // static const notFound = "Not found";
  // static const internalServerError = "Internal server error";
  // static const badGateway = "Bad gateway";
  static const badRequest = "Invalid request. Please try again.";
  static const unauthorized = "Unauthorized. Please log in.";
  static const forbidden =
      "Access denied. You don’t have permission to do this.";
  static const notFound = "The requested resource was not found.";
  static const internalServerError = "Server error. Try again later.";
  static const badGateway = "Server response error. Please try again.";
}
