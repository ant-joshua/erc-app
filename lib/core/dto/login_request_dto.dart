class LoginRequestDto {
  String username;
  String? password;
  String? fcmToken;
  String? deviceID;
  String? deviceModel;

  LoginRequestDto({
    required this.username,
    this.password,
    this.fcmToken,
    this.deviceID,
    this.deviceModel,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "fcmToken": fcmToken,
        "deviceID": deviceID,
        "deviceModel": deviceModel
      };
}
