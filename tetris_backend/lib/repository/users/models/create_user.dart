class CreateUser {
  const CreateUser({
    required this.nickname,
    required this.email,
  });

  final String nickname;
  final String email;

  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      nickname: json['nickname'],
      email: json['email'],
    );
  }
}
