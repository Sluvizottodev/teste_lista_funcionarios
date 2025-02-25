import 'package:flutter_test/flutter_test.dart';
import 'package:teste_pratico_mobile/utils/format/phone_form.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('PhoneFormatter', () {
    test('deve retornar "Não informado" para telefone vazio', () {
      expect(PhoneFormatter.formatPhone(""), "Não informado");
    });

    test('deve formatar telefone com 11 dígitos (DDD + 9 dígitos)', () {
      expect(PhoneFormatter.formatPhone("11987654321"), "+55 (11) 98765-4321");
    });

    test('deve formatar telefone com 13 dígitos (55 + DDD + 9 dígitos)', () {
      expect(PhoneFormatter.formatPhone("5511987654321"), "+55 (11) 98765-4321");
    });

    test('deve formatar telefone com 10 dígitos (DDD + 8 dígitos)', () {
      expect(PhoneFormatter.formatPhone("1198765432"), "+55 (11) 9876-5432");
    });

    test('deve formatar telefone com 9 dígitos (sem DDD)', () {
      expect(PhoneFormatter.formatPhone("987654321"), "98765-4321");
    });

    test('deve formatar telefone com 8 dígitos (sem DDD)', () {
      expect(PhoneFormatter.formatPhone("98765432"), "9876-5432");
    });

    test('deve lidar com entrada com caracteres não numéricos', () {
      expect(PhoneFormatter.formatPhone("(11) 98765-4321"), "+55 (11) 98765-4321");
    });

    test('deve retornar número sem formatação para comprimento inválido', () {
      expect(PhoneFormatter.formatPhone("123"), "123");
    });
  });
}