import 'package:books/data/gateways/local_logger_gateway.dart';
import 'package:books/domain/gateways/logger_gateway.dart';

class LoggerService {
  const LoggerService(this.tag);

  final String tag;

  void info(String message) {
    throw UnimplementedError();
  }

  void error(String message, {dynamic reason}) {
    throw UnimplementedError();
  }

  String message(String message) {
    return '[$tag] $message';
  }
}

class LocalLoggerService extends LoggerService {
  const LocalLoggerService(
    super.tag, {
    required this.logger,
  });

  factory LocalLoggerService.withTag(
    String tag,
  ) =>
      LocalLoggerService(
        tag,
        logger: LocalLoggerGateway.instance(),
      );

  final LoggerGateway logger;

  @override
  void error(String message, {dynamic reason}) {
    logger.error(this.message(message), reason: reason);
  }

  @override
  void info(String message) {
    logger.info(this.message(message));
  }
}
