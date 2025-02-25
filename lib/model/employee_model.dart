class Employee {
  final String id;
  final String name;
  final String job;
  final DateTime admissionDate;
  final String phone;
  final String image;

  Employee({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? '',
      name: json['name']?.toString() ?? 'Nome não informado',
      job: json['job']?.toString() ?? 'Cargo não informado',
      admissionDate: DateTime.parse(json['admission_date']),
      phone: json['phone'] != null ? json['phone'].toString().replaceAll(RegExp(r'\D'), '') : '',
      image: json['image'] ?? '',
    );
  }
}
