import 'package:flutter/material.dart';
import 'package:teste_pratico_mobile/utils/colors.dart';
import 'package:teste_pratico_mobile/utils/typography.dart';
import '../model/employee_model.dart';
import '../utils/format/date_form.dart';
import '../utils/format/phone_form.dart';

class EmployeeCard extends StatefulWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: isExpanded ? 4 : 2,
      child: InkWell(
        onTap: () => setState(() => isExpanded = !isExpanded),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.employee.image),
                backgroundColor: AppColors.Gray10,
              ),
              title: Text(
                widget.employee.name,
                style: AppTypography.displayMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.Black,
                ),
              ),
              trailing: Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppColors.BluePrimary,
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow("Cargo", widget.employee.job),
                    _buildDetailRow("Data de admissão", DateFormatter.formatDate(widget.employee.admissionDate)),
                    _buildDetailRow("Telefone", PhoneFormatter.formatPhone(widget.employee.phone)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.displayMedium.copyWith(fontWeight: FontWeight.bold)),
          Text(value, style: AppTypography.displayMedium),
        ],
      ),
    );
  }
}