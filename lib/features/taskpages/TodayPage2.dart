import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_todolist/core/models/task_adapter.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';
import 'package:flutter_todolist/features/home/homepages/HomePage.dart';
import 'package:flutter_todolist/core/cubit/home_cubit.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  int _bottomNavIndex = 0;

  final PageController _pageController = PageController();

  final TextEditingController _taskNameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final List<IconData> iconList = [Icons.home, Icons.send_and_archive];

  final List<Widget> pages = const [HomePage(), HomePage()];

  @override
  void dispose() {
    _pageController.dispose();
    _taskNameController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(taskAdapter: TaskAdapter()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _bottomNavIndex = index;
                  });
                },
                children: pages,
              ),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final cubit = context.read<HomeCubit>();

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    final navigator = Navigator.of(context);
                    return Padding(
                      padding: .only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Add'),

                          TextField(
                            controller: _taskNameController,
                            decoration: const InputDecoration(
                              labelText: 'taskname',
                            ),
                          ),

                          TextField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                              labelText: 'description',
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () async {
                              final taskName = _taskNameController.text;

                              final description = _descriptionController.text;

                              if (taskName.isEmpty || description.isEmpty) {
                                return;
                              }

                              await cubit.addTask(
                                taskname: taskName,
                                description: description,
                              );
                              await cubit.getTasks();
                              if (!navigator.mounted) return;
                              navigator.pop();
                            },
                            child: Text('Add'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              backgroundColor: ColorManager.ColorBrandprimaryDefault,
              child: const Icon(
                Icons.add,
                color: ColorManager.ColorNeutralWhite,
              ),
            ),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: iconList,
              activeColor: ColorManager.ColorBrandprimaryDefault,
              activeIndex: _bottomNavIndex,
              gapLocation: .center,
              notchSmoothness: .verySmoothEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              onTap: (index) {
                setState(() {
                  _bottomNavIndex = index;
                });

                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeInOut,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
