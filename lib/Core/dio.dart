import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = Dio()




  ..interceptors.add(
    PrettyDioLogger(
      responseBody: true,
      responseHeader: false,
      requestBody: true,
    ),
  )
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({'Content-Type': 'application/json'});
        return handler.next(options);
      },
    ),
  );
