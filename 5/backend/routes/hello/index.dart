import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final request = context.request;
  final headers = request.headers;
  final languageIsoCode = headers[HttpHeaders.acceptLanguageHeader];

  var helloStr = _helloMap[languageIsoCode];
  helloStr = helloStr ?? _helloMap['en'];
  return Response.json(body: helloStr);
}

final _helloMap = {
  'en': 'Hello!',
  'ru': 'Привет!',
};
