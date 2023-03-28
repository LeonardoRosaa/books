import 'package:books/data/gateways/local_logger_gateway.dart';
import 'package:books/domain/gateways/logger_gateway.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/others.dart';

void main() {

  group('Local logger gateway', () { 

    late Faker faker;

    late Logger logger;

    late LoggerGateway loggerGateway;

    late String message;

    setUp(() {
      faker = Faker();
      logger = MockLogger();

      loggerGateway = LocalLoggerGateway(logger: logger);

      message = faker.randomGenerator.string(100);
    });

    test('logged info', () {
      when(() => logger.i(message)).thenAnswer((_) { });

      loggerGateway.info(message);

      verify(() => logger.i(message)).called(1);
    });

    test('logged error', () {
      final exception = Exception();
      when(() => logger.e(message, exception)).thenAnswer((_) { });

      loggerGateway.error(message, reason: exception);

      verify(() => logger.e(message, exception)).called(1);
    });
  });
}