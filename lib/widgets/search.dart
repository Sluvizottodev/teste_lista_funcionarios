import 'package:flutter/material.dart';
import 'package:teste_pratico_mobile/utils/colors.dart';
import 'package:teste_pratico_mobile/utils/typography.dart';
import '../utils/shadow.dart';
import '../utils/space.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchField({
    super.key,
    required this.controller,
    this.hintText = 'Pesquisar',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.Gray05,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [AppShadows.lightShadow],
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.regular16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTypography.displayMedium.copyWith(color: AppColors.Black),
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: AppColors.Black),
          hintText: hintText,
          hintStyle: AppTypography.displayMedium.copyWith(color: AppColors.Gray20),
          border: InputBorder.none,
        ),
      ),
    );
  }
}