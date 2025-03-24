import 'package:tetris/http/http_client.dart';
import 'package:tetris/user/domain/entity/user_entity.dart';
import 'package:tetris/user/domain/i_user_repository.dart';

final class UserRepository implements IUserRepository {
  /// HTTP-клиент
  final IHttpClient httpClient;

  UserRepository({required this.httpClient});

  @override
  Future<UserEntity> createUser(String username, String scores) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> fetchUsers() {
    // TODO: implement fetchUsers
    throw UnimplementedError();
  }
}
