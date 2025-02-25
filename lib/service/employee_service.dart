import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/employee_model.dart';

class EmployeeService {
  final String baseUrl = 'http://localhost:3000/employees';

  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Employee.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar funcionários');
    }
  }
}
