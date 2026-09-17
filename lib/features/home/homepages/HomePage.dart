import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/features/home/homepages/showdialogsuccuss.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_todolist/core/cubit/home_cubit.dart';
import 'package:flutter_todolist/core/cubit/home_state.dart';
import 'package:flutter_todolist/core/styles/Units.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';
import 'package:flutter_todolist/features/taskpages/cards/TodayCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Units.height(context, 30)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Units.width(context, 20),
              ),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: Units.font(context, 32),
                  fontWeight: FontWeight.bold,
                  color: ColorManager.ColorNeutralPrimary,
                ),
              ),
            ),
            SizedBox(height: Units.height(context, 10)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Units.width(context, 20),
              ),
              child: Text(
                'Best platform for creating to-do lists',
                style: TextStyle(
                  fontSize: Units.font(context, 18),
                  color: ColorManager.ColorNeutralSecondary,
                ),
              ),
            ),
            SizedBox(height: Units.height(context, 40)),
            Expanded(
              child: BlocListener<HomeCubit, HomeState>(
                listenWhen: (previous, current) =>
                    current is SuccessdeleteTaskState,
                listener: (context, state) {
                  if (state is SuccessdeleteTaskState) {
                    Showdialogsuccuss.show(
                      context: context,
                      text: 'Task deleted successfully',
                      lottie: 'assets/loitte/Success.json',
                    );
                  }
                },
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is LoadingTaskGettingState ||
                      current is FailedToGetTaskState ||
                      current is SuccessGettingTaskState ||
                      current is LoadingTaskdeleteState ||
                      current is SuccessdeleteTaskState ||
                      current is FailedTodeleteTaskState,
                  builder: (context, state) {
                    if (state is LoadingTaskGettingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is FailedToGetTaskState) {
                      return Center(child: Text(state.message));
                    }

                    if (state is FailedTodeleteTaskState) {
                      return Center(child: Text(state.message));
                    }

                    if (state is SuccessGettingTaskState) {
                      if (state.tasks.isEmpty) {
                        return const Center(child: Text('No tasks'));
                      }

                      return ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: Units.width(context, 20),
                        ),
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          final task = state.tasks[index];

                          return Card(child: TodayCard(task: task));
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
