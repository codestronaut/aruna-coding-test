import 'package:aruna_coding_test/src/data/data.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  BlogRemoteDS,
  BlogRepository,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}
