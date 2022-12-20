import 'package:aruna_coding_test/src/data/data_sources/blog_remote_ds.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  BlogRemoteDS,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}
