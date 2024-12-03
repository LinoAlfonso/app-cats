import 'package:app_cats/src/features/feature_cats/domain/domain.dart';
import 'package:app_cats/src/features/feature_cats/presentation/providers/cats_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cats_provider_test.mocks.dart';

@GenerateMocks([CatsRepository])

void main(){
  late CatsProvider provider;
  late MockCatsRepository mockRepository;

  setUp((){
    mockRepository = MockCatsRepository();
    provider = CatsProvider(catsRepository: mockRepository);
  });

  test("Debe actulizar la lista de razas de gatos", ()async {
    // Arrange
    final mockCats = [
      Cat(
        id: "2",
        name: "Aegean",
        description: "The Aegean"
      ),
      Cat(
        id: "3",
        name: "Abyssinian",
        description: "The Abyss"
      ),
    ];

    when(mockRepository.getBreedsCats(page: 0)).thenAnswer((_) async => mockCats);

    // Act
    await provider.getBreedsCats();

    // Assert
    expect(provider.pagingController.itemList, mockCats);
    expect(provider.pagingController.itemList![0].name, "Aegean");
    verify(mockRepository.getBreedsCats(page: 0)).called(1);

      });



}