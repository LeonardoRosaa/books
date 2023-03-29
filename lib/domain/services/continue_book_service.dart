import 'package:books/data/data.dart';
import 'package:books/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final continueBookServiceProvider = Provider<BookService>(
  (ref) => ContinueBookServiceImpl(
    bookGateway: ref.read(localContinueBookGatewayProvider),
    loggerService: LocalLoggerService.withTag('Continue Book Service'),
  ),
);

class ContinueBookServiceImpl extends BookService {
  const ContinueBookServiceImpl({
    required super.bookGateway,
    required super.loggerService,
  });
}
