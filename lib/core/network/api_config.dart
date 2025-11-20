class ApiConfig {
  ApiConfig._();

  static const String baseUrl = "https://cloud-api.livekit.io/api";
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
  };

  // Endpoints
  static const String login = '/auth/login';
  static const String gernateTokenSandBox = '/sandbox/connection-details';
}
