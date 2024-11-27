import 'package:app_cats/src/features/feature_cats/domain/domain.dart';
import 'package:app_cats/src/features/feature_cats/feature_cats.dart';
import 'package:app_cats/src/features/feature_cats/presentation/widgets/card_cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('CatCard Widget', ()
  {
    testWidgets(
        'Debe mostrar el nombre del gato y llamar al callback al presionar el botón', (
        WidgetTester tester) async {
      // Arrange
      final cat = Cat(
        id: '1',
        name: 'Abyssinian',
        origin: 'Egipto',
        intelligence: 5,
        imageCat: ImageCat(
            url: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg'),
      );

      bool wasTapped = false;

      void onTapCat(Cat tappedCat) {
        wasTapped = true;
        expect(tappedCat, cat); // Verifica que el gato correcto se pasa al callback
      }

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CatCard(cat: cat, onTapCat: onTapCat),
          ),
        ),
      );

      // Assert
      expect(find.text('Abyssinian'), findsOneWidget);

      // Simulacion de la interacción del usuario
      final buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsOneWidget);
      await tester.tap(buttonFinder);
      await tester.pump();

      expect(wasTapped, isTrue);
    });
  });
}