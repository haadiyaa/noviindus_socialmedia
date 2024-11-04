// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    Token token;
    String phone;
    bool status;
    // bool privilage;
    // String message;

    OtpModel({
        required this.token,
        required this.phone,
        required this.status,
        // required this.privilage,
        // required this.message,
    });

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        token: Token.fromJson(json["token"]),
        phone: json["phone"],
        status: json["status"],
        // privilage: json["privilage"],
        // message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "phone": phone,
        "status": status,
        // "privilage": privilage,
        // "message": message,
    };
}

class Token {
    // String refresh;
    String access;

    Token({
        // required this.refresh,
        required this.access,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        // refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        // "refresh": refresh,
        "access": access,
    };
}
