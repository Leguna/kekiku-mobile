import '../../core/index.dart';

class ProductRemoteSource extends BaseApiClient {
  Future<String> getProducts() async {
    final response = await client.get('/cake');
    return response.data;
  }

  Future<String> getProduct(String id) async {
    final response = await client.get('/products/$id');
    return response.data;
  }
}
