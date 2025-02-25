import 'package:flutter/material.dart';
import 'package:teste_pratico_mobile/utils/colors.dart';
import 'package:teste_pratico_mobile/utils/shadow.dart';
import 'package:teste_pratico_mobile/utils/typography.dart';
import '../model/employee_model.dart';
import '../service/employee_service.dart';
import '../utils/space.dart';
import '../widgets/employee_card.dart';
import '../widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.White,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.regular16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.Gray10,
                    child: Text('CG', style: TextStyle(color: AppColors.Black)),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none, size: 28),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.BluePrimary,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: AppColors.White,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.regular16),
              child: Text('Funcionários', style: AppTypography.displayLarge),
            ),
            const SizedBox(height: AppSpacing.regular16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.regular16),
              child: SearchField(
                controller: _searchController,
                hintText: 'Pesquisar',
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: AppSpacing.regular16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.regular16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.Gray05,
                    borderRadius: BorderRadius.circular(AppSpacing.little08),
                    boxShadow: [AppShadows.primaryShadow],
                  ),
                  child: FutureBuilder<List<Employee>>(
                    future: EmployeeService().fetchEmployees(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Erro: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('Nenhum funcionário encontrado.'));
                      }

                      final employees = snapshot.data!;
                      return ListView.builder(
                        itemCount: employees.length,
                        itemBuilder: (context, index) {
                          return EmployeeCard(employee: employees[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
