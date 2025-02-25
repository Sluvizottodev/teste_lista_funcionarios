import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_pratico_mobile/utils/colors.dart';
import 'package:teste_pratico_mobile/utils/shadow.dart';
import 'package:teste_pratico_mobile/utils/typography.dart';
import '../utils/space.dart';
import '../provider/employee_provider.dart';
import '../widgets/employee_card.dart';
import '../widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeProvider()..loadEmployees(),
      child: Scaffold(
        backgroundColor: AppColors.White,
        body: SafeArea(
          child: Consumer<EmployeeProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.regular16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.Gray10,
                          child: Text('CG',
                              style: TextStyle(color: AppColors.Black)),
                        ),
                        Stack(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.notifications_none,
                                  size: 28),
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
                                  '02',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.regular16),
                    child:
                        Text('Funcionários', style: AppTypography.displayLarge),
                  ),
                  const SizedBox(height: AppSpacing.regular16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.regular16),
                    child: SearchField(
                      controller: _searchController,
                      // Passa o controller para o SearchField
                      hintText: 'Pesquisar',
                      onChanged: provider.filterEmployees,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.regular16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.regular16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.Gray05,
                          borderRadius:
                              BorderRadius.circular(AppSpacing.little08),
                          boxShadow: [AppShadows.primaryShadow],
                        ),
                        child: provider.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : provider.employees.isEmpty
                                ? const Center(
                                    child:
                                        Text('Nenhum funcionário encontrado.'))
                                : ListView.builder(
                                    itemCount: provider.employees.length,
                                    itemBuilder: (context, index) {
                                      return EmployeeCard(
                                          employee: provider.employees[index]);
                                    },
                                  ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
