class ModelArticles {
  ModelArticles({
    this.code,
    this.status,
    this.message,
    this.articles,
  });

  int? code;
  bool? status;
  String? message;
  List<Article>? articles;

  factory ModelArticles.fromJson(Map<String, dynamic> json) => ModelArticles(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        articles: List<Article>.from(
          json["articles"].map((x) => Article.fromJson(x)),
        ),
      );
}

class Article {
  Article({
    this.uuid,
    this.title,
    this.content,
    this.image,
    this.views,
    this.created,
    this.user,
  });

  String? uuid;
  String? title;
  String? content;
  String? image;
  int? views;
  Created? created;
  User? user;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        uuid: json["uuid"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        views: json["views"],
        created: Created.fromJson(json["created"]),
        user: User.fromJson(json["user"]),
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
  Timezone? timezone;

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: timezoneValues.map?[json["timezone"]],
      );
}

enum Timezone { utc }

final timezoneValues = EnumValues({"UTC": Timezone.utc});

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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
