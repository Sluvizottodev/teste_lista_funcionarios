import 'package:flutter/material.dart';
import '../model/employee_model.dart';
import '../service/employee_service.dart';

class EmployeeProvider extends ChangeNotifier {
  final EmployeeService _service = EmployeeService();
  List<Employee> _allEmployees = [];
  List<Employee> _filteredEmployees = [];
  bool _isLoading = false;

  List<Employee> get employees => _filteredEmployees;
  bool get isLoading => _isLoading;

  Future<void> loadEmployees() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allEmployees = await _service.fetchEmployees();
      _filteredEmployees = List.from(_allEmployees); // Garante cópia para evitar referência direta
    } catch (e) {
      _allEmployees = [];
      _filteredEmployees = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void filterEmployees(String query) {
    if (query.isEmpty) {
      _filteredEmployees = List.from(_allEmployees);
    } else {
      _filteredEmployees = _allEmployees
          .where((employee) => employee.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}