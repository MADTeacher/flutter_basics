class CreateGameResult {
  CreateGameResult({
    required this.userId,
    required this.result,
  });

  final int userId;
  final int result;

  factory CreateGameResult.fromJson(Map<String, dynamic> json) =>
      CreateGameResult(
        userId: json['userId'],
        result: json['result'],
      );
}
