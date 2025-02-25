import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/employee_provider.dart';
import '../utils/shadow.dart';
import '../widgets/employee_card.dart';
import '../widgets/search.dart';
import '../utils/colors.dart';
import '../utils/typography.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 24,
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
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Funcionários', style: AppTypography.displayLarge),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchField(
                controller: _searchController,
                hintText: 'Pesquisar',
                onChanged: (query) {
                  Provider.of<EmployeeProvider>(context, listen: false).filterEmployees(query);
                },
              ),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: Consumer<EmployeeProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.employees.isEmpty) {
                    return const Center(child: Text('Nenhum funcionário encontrado.'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.White,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [AppShadows.lightShadow],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: const BoxDecoration(
                                color: AppColors.Gray10,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Foto',
                                    style: AppTypography.displayMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.Black,
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  Text(
                                    'Nome',
                                    style: AppTypography.displayMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.Black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: provider.employees.length,
                                separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.Gray10),
                                itemBuilder: (context, index) {
                                  return EmployeeCard(
                                    employee: provider.employees[index],
                                    showDivider: index < provider.employees.length - 1,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}