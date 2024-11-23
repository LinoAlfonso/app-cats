import '../domain.dart';

abstract class CatsRepository {

  Future<List<Cat>> getBreedsCats({required int page});

  Future<List<Cat>> getSearchCats(String queryName);

  Future<Cat> getCatDetail(String id);

}