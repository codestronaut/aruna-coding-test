import 'package:aruna_coding_test/src/data/data_sources/blog_remote_ds.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  BlogRemoteDS,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}
