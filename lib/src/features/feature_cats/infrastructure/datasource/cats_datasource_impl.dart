import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../config/config.dart';
import '../../domain/domain.dart';
import '../mappers/cat_mapper.dart';

class CatsDatasourceImpl implements CatsDatasource {

  @override
  Future<List<Cat>> getBreedsCats({required int page}) async {
    try {
      final uri = Uri.parse(ApiRoutes.getBreedsCats).replace(queryParameters: {
        'limit': "20",
        'page': page.toString(),
      });

      final response = await http.get(uri, headers: ApiHeaders.headers)
          .timeout(ApiHeaders().timeOut).catchError((value) {
        throw "errorServeTimeOut";
      });
      List data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<Cat> cats = [];
        for (var item in data ) {
          cats.add(CatMapper.jsonToEntity(item));
        }
        return cats;
      } else {
        throw "Error response cats";
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Cat> getCatDetail(String id) {
    // TODO: implement getCatDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Cat>> getSearchCats(String queryName) {
    // TODO: implement getSearchCats
    throw UnimplementedError();
  }

}