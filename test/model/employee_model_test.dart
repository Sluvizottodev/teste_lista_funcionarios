import 'package:teste_pratico_mobile/model/employee_model.dart';

void main() {
  Map<String, dynamic> json = {
    'id': '1',
    'name': 'João Silva',
    'job': 'Desenvolvedor',
    'admission_date': '2023-01-15',
    'phone': '5551234567890',
    'image': 'https://example.com/image.jpg',
  };

  Employee employee = Employee.fromJson(json);
  print(employee.name); // exibir: João Silva
  print(employee.job);
  print(employee.admissionDate);
  print(employee.phone);
  print(employee.image);
}