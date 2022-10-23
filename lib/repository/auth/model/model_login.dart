class ModelLogin {
  ModelLogin({
    this.code,
    this.status,
    this.message,
    this.user,
  });

  int? code;
  bool? status;
  String? message;
  User? user;

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    this.name,
    this.email,
    this.phoneNumber,
    this.created,
    this.uuid,
  });

  String? name;
  String? email;
  String? phoneNumber;
  Created? created;
  String? uuid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );
}

class Created {
  Created({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime? date;
  int? timezoneType;
  String? timezone;

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );
}
