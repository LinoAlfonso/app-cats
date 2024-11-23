

import '../../features/feature_cats/domain/domain.dart';
import '../../features/feature_cats/infrastructure/infrastructure.dart';
import '../../features/feature_cats/presentation/presentation.dart';

class FactorySetupProviders {

  /*Provider breeds cats*/
  static CatsDatasource createBreedsCatsDatasource() {
    return CatsDatasourceImpl();
  }

  static CatsRepository createBreedsCatsRepository() {
    return CatsRepositoryImpl(remoteDatasource: createBreedsCatsDatasource());
  }

  static CatsProvider createBreedsCatsProvider() {
    return CatsProvider(catsRepository: createBreedsCatsRepository());
  }

}