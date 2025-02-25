import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_pratico_mobile/utils/colors.dart';
import 'package:teste_pratico_mobile/utils/typography.dart';
import 'package:teste_pratico_mobile/widgets/search.dart';

void main() {
  group('SearchField', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets('deve renderizar com hintText padrão "Pesquisar"', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              controller: controller,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Pesquisar'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('deve renderizar com hintText personalizado', (WidgetTester tester) async {
      const customHint = 'Buscar funcionários';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              controller: controller,
              hintText: customHint,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text(customHint), findsOneWidget);
      expect(find.text('Pesquisar'), findsNothing);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('deve chamar onChanged quando o texto é digitado', (WidgetTester tester) async {
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              controller: controller,
              onChanged: (value) {
                changedValue = value;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'teste');
      await tester.pump();

      expect(changedValue, 'teste');
    });

    testWidgets('deve aplicar estilos corretos ao TextField', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              controller: controller,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.style?.color, AppColors.Black);
      expect(textField.style?.fontSize, AppTypography.displayMedium.fontSize);
      expect(textField.decoration?.border, InputBorder.none);
      expect(textField.decoration?.hintStyle?.color, AppColors.Gray20);
    });

    testWidgets('deve renderizar Container com decoração correta', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              controller: controller,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, AppColors.Gray05);
      expect(decoration.borderRadius, BorderRadius.circular(40));
      expect(decoration.boxShadow, isNotEmpty);
    });
  });
}