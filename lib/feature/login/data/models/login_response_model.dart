class GenerateTokenSandBox {
  String? serverUrl;
  String? roomName;
  String? participantName;
  String? participantToken;

  GenerateTokenSandBox({
    this.serverUrl,
    this.roomName,
    this.participantName,
    this.participantToken,
  });

  GenerateTokenSandBox.fromJson(Map<String, dynamic> json) {
    serverUrl = json['serverUrl'];
    roomName = json['roomName'];
    participantName = json['participantName'];
    participantToken = json['participantToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serverUrl'] = this.serverUrl;
    data['roomName'] = this.roomName;
    data['participantName'] = this.participantName;
    data['participantToken'] = this.participantToken;
    return data;
  }
}
