class GenerateTokenSandBoxRequestModel {
  final String roomName;
  final String participantName;
  final Map<String, String> headers;

  GenerateTokenSandBoxRequestModel({
    required this.roomName,
    required this.participantName,
    required this.headers,
  });

  Map<String, dynamic> toJson() {
    return {'roomName': roomName, 'participantName': participantName};
  }
}
