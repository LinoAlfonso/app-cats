import 'package:app_cats/src/features/feature_cats/domain/domain.dart';
import 'package:app_cats/src/features/feature_cats/feature_cats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'list_view_cats_pagination_test.mocks.dart';


class FakePagingController extends PagingController<int, Cat> {
  FakePagingController() : super(firstPageKey: 0);
}

@GenerateMocks([CatsProvider])
void main(){
  group("PagedListView", (){

    late MockCatsProvider mockCatsProvider;
    late FakePagingController fakePagingController;

    setUp(() {
      mockCatsProvider = MockCatsProvider();
      fakePagingController = FakePagingController();
      when(mockCatsProvider.pagingController).thenReturn(fakePagingController);
    });

    testWidgets("Debe mostrar la lista de razas correctamente", (WidgetTester tester) async {
      // Arrange
      final mockInitialCats = [
        Cat(
            id: "1",
            name: "Aegean",
            description: "The Aegean"
        ),
        Cat(
            id: "2",
            name: "Abyssinian",
            description: "The Abyss"
        ),
      ];

      fakePagingController.itemList = mockInitialCats;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListViewCatsPagination(
              catsProvider: mockCatsProvider,
              onTapCat: (cat) {},
            ),
          ),
        ),
      );
      // Assert verifica que se muestren los elementos de la lista
      expect(find.text("Aegean"), findsOneWidget);
      expect(find.text("Abyssinian"), findsOneWidget);
    });

    testWidgets('Debe mostrar el mensaje de no se encotraron resultados', (WidgetTester tester) async {
      // Arrange
      fakePagingController.itemList = [];
      fakePagingController.error = null; // No hay error

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListViewCatsPagination(
              catsProvider: mockCatsProvider,
              onTapCat: (cat) {},
            ),
          ),
        ),
      );

      // Act
      fakePagingController.notifyListeners(); // Notificamos el cambio
      await tester.pump();

      // Assert: Verifica que se muestra el mensaje
      expect(find.text('Search results...'), findsOneWidget);
    });

  });
}