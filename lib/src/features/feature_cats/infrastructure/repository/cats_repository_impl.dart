
import '../../domain/domain.dart';

class CatsRepositoryImpl implements CatsRepository {

  final CatsDatasource remoteDatasource;

  CatsRepositoryImpl({required this.remoteDatasource});


  @override
  Future<List<Cat>> getBreedsCats({required int page}) {
    return remoteDatasource.getBreedsCats(page: page);
  }

  @override
  Future<Cat> getCatDetail(String id) {
    return remoteDatasource.getCatDetail(id);
  }

  @override
  Future<List<Cat>> getSearchCats(String queryName) {
    return remoteDatasource.getSearchCats(queryName);
  }
}