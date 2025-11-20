class RefreshTokenDetail {
  final TokenStatus tokenStatus;
  final String serverUrl;
  final String roomName;
  final String participantName;
  final String participantToken;

  RefreshTokenDetail({
    required this.tokenStatus,
    required this.serverUrl,
    required this.roomName,
    required this.participantName,
    required this.participantToken,
  });
  Map<String, dynamic> toJson() {
    return {
      'tokenStatus': tokenStatus.name,
      'serverUrl': serverUrl,
      'roomName': roomName,
      'participantName': participantName,
      'participantToken': participantToken,
    };
  }

  factory RefreshTokenDetail.fromJson(Map<String, dynamic> json) {
    return RefreshTokenDetail(
      tokenStatus: TokenStatus.values.byName(json['tokenStatus']),
      serverUrl: json['serverUrl'],
      roomName: json['roomName'],
      participantName: json['participantName'],
      participantToken: json['participantToken'],
    );
  }
  RefreshTokenDetail copyWith({
    TokenStatus? tokenStatus,
    String? serverUrl,
    String? roomName,
    String? participantName,
    String? participantToken,
  }) {
    return RefreshTokenDetail(
      tokenStatus: tokenStatus ?? this.tokenStatus,
      serverUrl: serverUrl ?? this.serverUrl,
      roomName: roomName ?? this.roomName,
      participantName: participantName ?? this.participantName,
      participantToken: participantToken ?? this.participantToken,
    );
  }

  @override
  String toString() {
    return 'RefreshTokenDetail(tokenStatus: $tokenStatus, serverUrl: $serverUrl, roomName: $roomName, participantName: $participantName, participantToken: $participantToken)';
  }
}

enum TokenStatus { notGenerated, generated, expired }
