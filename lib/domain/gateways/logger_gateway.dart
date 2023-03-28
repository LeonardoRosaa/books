abstract class LoggerGateway {
  void info(String message);

  void error(
    String message, {
    dynamic reason,
  });
}
