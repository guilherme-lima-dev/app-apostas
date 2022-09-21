import 'package:flutter/cupertino.dart';

@immutable
class User {
  final int? id;
  final String name;
  final String username;
  final String email;
  final String? emailConfirmation;
  final String password;
  final String? passwordConfirm;

  User({
    this.id,
    this.name = '',
    this.username = '',
    this.email = '',
    this.emailConfirmation,
    this.password = '',
    this.passwordConfirm,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'email': email,
        'email_confirmation': emailConfirmation,
        'password': password,
        'password_confirm': passwordConfirm,
      };

  User copyWith({
    String? name,
    String? username,
    String? email,
    String? emailConfirmation,
    String? password,
    String? passwordConfirm,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      emailConfirmation: emailConfirmation ?? this.emailConfirmation,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
    );
  }
}
