import 'dart:convert'; // Importar dart:convert para usar utf8.decode
import 'package:http/http.dart' as http;
import '../model/employee_model.dart';

class EmployeeService {
  final String baseUrl = 'http://10.0.2.2:3000/employees';

  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);
      return data.map((e) => Employee.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar funcionários');
    }
  }
}