import 'package:books/domain/domain.dart';
import 'package:logger/logger.dart';

class LocalLoggerGateway implements LoggerGateway {
  const LocalLoggerGateway({
    required this.logger,
  });

  factory LocalLoggerGateway.instance() => LocalLoggerGateway(
        logger: Logger(),
      );

  final Logger logger;

  @override
  void info(String message) {
    logger.i(message);
  }

  @override
  void error(
    String message, {
    dynamic reason,
  }) {
    logger.e(message, reason);
  }
}
