import 'package:flutter/material.dart';
import 'package:teste_pratico_mobile/utils/colors.dart';
import 'package:teste_pratico_mobile/utils/typography.dart';
import '../model/employee_model.dart';
import '../utils/format/date_form.dart';
import '../utils/format/phone_form.dart';

class EmployeeCard extends StatefulWidget {
  final Employee employee;
  final bool showDivider;

  const EmployeeCard({
    super.key,
    required this.employee,
    this.showDivider = true,
  });

  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(widget.employee.image),
                  backgroundColor: AppColors.Gray10,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.employee.name,
                    style: AppTypography.displayMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.Black,
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.BluePrimary,
                ),
              ],
            ),
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
        if (widget.showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.Gray10,
          ),
      ],
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