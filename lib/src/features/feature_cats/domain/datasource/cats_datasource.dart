import '../domain.dart';

abstract class CatsDatasource {

  Future<List<Cat>> getBreedsCats({required int page});

  Future<List<Cat>> getSearchCats({required String queryName});

  Future<Cat> getCatDetail(String id);

}