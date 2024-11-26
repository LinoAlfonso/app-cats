
import 'package:app_cats/src/features/feature_cats/domain/datasource/cats_datasource.dart';
import 'package:app_cats/src/features/feature_cats/domain/entities/cat.dart';
import 'package:app_cats/src/features/feature_cats/infrastructure/repository/cats_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'cat_repository_impl_test.mocks.dart';

@GenerateMocks([CatsDatasource])

void main() {

  late CatsRepositoryImpl repository;
  late MockCatsDatasource dataSource;

  setUp(() {
    dataSource = MockCatsDatasource();
    repository = CatsRepositoryImpl(remoteDatasource: dataSource);
  });
  
  test("Debe devolver un listado de raza de gatos, cuando la fuente de datos recupere los datos",
      ()async {
    // Arrange
      final List<Cat> mockCats = [
        Cat(
          id: "1",
          name: "Abyssinian",
          description: "The Abyss"
        ),
        Cat(
          id: "2",
          name: "Aegean",
          description: "The Aegean"
        ),
      ];
      when(dataSource.getBreedsCats(page: 1)).thenAnswer((_) async => mockCats);

      // Act
      final result = await repository.getBreedsCats(page: 1);
      // Assert
      expect(result, mockCats);
      expect(result[0].name, "Abyssinian");
      verify(dataSource.getBreedsCats(page: 1));

      });
  
     test("Debe lanzar una exception cuanod la fuente de datos falla", () async {
       // Arrange
       when(dataSource.getBreedsCats(page: 1)).thenThrow(Exception("Error al obtener los datos"));
       expect(() async => await repository.getBreedsCats(page: 1), throwsException);

     });

  
}
