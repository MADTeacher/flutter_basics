import 'package:flutter_test/flutter_test.dart';
import 'package:tetris/features/leaderboard/data/leaderboard_dto.dart';

Future<void> main() async {
  group('Тестирование LeaderboardDto', () {
    group('Тестирование функции toJson', () {
      test('Проверка преобразования DTO в JSON', () {
        // Подготовка
        final dto = LeaderboardDto(
          id: 1,
          username: 'testUser',
          score: 150,
        );

        // Действие
        final json = {
          'id': dto.id,
          'username': dto.username,
          'score': dto.score,
        };

        // Проверка
        expect(json['id'], 1);
        expect(json['username'], 'testUser');
        expect(json['score'], 150);
      });
    });

    group('Тестирование функции toEntity', () {
      test('Проверка преобразования DTO в сущность', () {
        // Подготовка
        final dto = LeaderboardDto(
          id: 1,
          username: 'testUser',
          score: 150,
        );

        // Действие
        final entity = dto.toEntity();

        // Проверка
        expect(entity.id, 1);
        expect(entity.username, 'testUser');
        expect(entity.score, 150);
      });
    });

    group('Тестирование LeaderboardDto', () {
      group('Тестирование функции fromJson', () {
        test('Проверка с правильным входящим JSON', () {
          // Подготовка
          final json = {
            'id': 1,
            'username': 'testUser',
            'score': 150,
          };

          // Действие
          final dto = LeaderboardDto.fromJson(json);

          // Проверка
          expect(dto.id, 1);
          expect(dto.username, 'testUser');
          expect(dto.score, 150);
        });

        test('Проверка отсутствия поля [score] в json', () {
          // Подготовка
          final json = {
            'id': 2,
            'username': 'anotherUser',
          };

          // Действие
          final dto = LeaderboardDto.fromJson(json);

          // Проверка
          expect(dto.score, 0);
        });

        test('Проверка, если id не типа int', () {
          // Подготовка
          final json = {
            // Неправильный тип
            'id': 'invalid_id',
            'username': 'user',
            'score': 100,
          };

          // Действие и проверка
          // [ throwsA(isA<TypeError>())] - проверяет, что выбрасывается
          // ошибка типа TypeError
          expect(
              () => LeaderboardDto.fromJson(json),
              throwsA(
                isA<TypeError>(),
              ));
        });

        test('Проверка, json пустой', () {
          // Подготовка
          final json = <String, dynamic>{};

          // Действие и проверка
          // [ throwsA(isA<TypeError>())] - проверяет, что выбрасывается
          // ошибка типа TypeError
          expect(
              () => LeaderboardDto.fromJson(json),
              throwsA(
                isA<TypeError>(),
              ));
        });
      });
    });
  });
}
