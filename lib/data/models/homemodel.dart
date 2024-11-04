// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    List<dynamic> user;
    List<dynamic> banners;
    List<CategoryDict> categoryDict;
    List<Result> results;
    bool status;
    bool next;

    HomeModel({
        required this.user,
        required this.banners,
        required this.categoryDict,
        required this.results,
        required this.status,
        required this.next,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        user: List<dynamic>.from(json["user"].map((x) => x)),
        banners: List<dynamic>.from(json["banners"].map((x) => x)),
        categoryDict: List<CategoryDict>.from(json["category_dict"].map((x) => CategoryDict.fromJson(x))),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x)),
        "banners": List<dynamic>.from(banners.map((x) => x)),
        "category_dict": List<dynamic>.from(categoryDict.map((x) => x.toJson())),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "next": next,
    };
}

class CategoryDict {
    String id;
    String title;

    CategoryDict({
        required this.id,
        required this.title,
    });

    factory CategoryDict.fromJson(Map<String, dynamic> json) => CategoryDict(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}

class Result {
    int id;
    String description;
    String image;
    String video;
    List<int> likes;
    List<dynamic> dislikes;
    List<dynamic> bookmarks;
    List<int> hide;
    DateTime createdAt;
    bool follow;
    User user;

    Result({
        required this.id,
        required this.description,
        required this.image,
        required this.video,
        required this.likes,
        required this.dislikes,
        required this.bookmarks,
        required this.hide,
        required this.createdAt,
        required this.follow,
        required this.user,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        description: json["description"],
        image: json["image"],
        video: json["video"],
        likes: List<int>.from(json["likes"].map((x) => x)),
        dislikes: List<dynamic>.from(json["dislikes"].map((x) => x)),
        bookmarks: List<dynamic>.from(json["bookmarks"].map((x) => x)),
        hide: List<int>.from(json["hide"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        follow: json["follow"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "image": image,
        "video": video,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "dislikes": List<dynamic>.from(dislikes.map((x) => x)),
        "bookmarks": List<dynamic>.from(bookmarks.map((x) => x)),
        "hide": List<dynamic>.from(hide.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "follow": follow,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    dynamic image;

    User({
        required this.id,
        required this.name,
        required this.image,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
