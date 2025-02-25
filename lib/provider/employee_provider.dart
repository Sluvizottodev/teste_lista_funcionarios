import 'package:flutter/material.dart';

import '../model/employee_model.dart';
import '../service/employee_service.dart';

class EmployeeProvider extends ChangeNotifier {
  final EmployeeService _service = EmployeeService();
  List<Employee> _employees = [];
  bool _isLoading = false;

  List<Employee> get employees => _employees;
  bool get isLoading => _isLoading;

  Future<void> loadEmployees() async {
    _isLoading = true;
    notifyListeners();

    try {
      _employees = await _service.fetchEmployees();
    } catch (e) {
      _employees = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
