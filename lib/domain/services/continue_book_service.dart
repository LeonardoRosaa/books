import 'package:books/domain/domain.dart';

class ContinueBookServiceImpl extends BookService {

  const ContinueBookServiceImpl({ 
    required super.bookGateway,
    required super.loggerService,
  });
}