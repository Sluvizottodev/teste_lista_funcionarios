import 'package:flutter/material.dart';
import 'package:teste_pratico_mobile/utils/colors.dart';
import 'package:teste_pratico_mobile/utils/typography.dart';
import '../model/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(employee.image),
        backgroundColor: AppColors.Gray10,
      ),
      title: Text(employee.name, style: AppTypography.displayMedium),
      subtitle: Text(employee.job, style: AppTypography.displayMedium),
      trailing: const Icon(Icons.keyboard_arrow_right, color: AppColors.BluePrimary),
      onTap: () {
        //
      },
    );
  }
}
