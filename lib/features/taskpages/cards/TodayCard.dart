import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/core/cubit/home_cubit.dart';
import 'package:flutter_todolist/core/models/task_model.dart';
import 'package:flutter_todolist/core/styles/Units.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';

class TodayCard extends StatefulWidget {
  final TaskModel task;

  const TodayCard({super.key, required this.task});

  @override
  State<TodayCard> createState() => _TodayCardState();
}

class _TodayCardState extends State<TodayCard> {
  bool isdone = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final cubit = context.read<HomeCubit>();
        final taskNameController = TextEditingController(
          text: widget.task.taskname,
        );

        final descriptionController = TextEditingController(
          text: widget.task.description,
        );

        showDialog(
          context: context,
          builder: (contextOfdialog) {
            return AlertDialog(
              title: const Text('Edit Task', textAlign: TextAlign.center),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: taskNameController,
                    decoration: const InputDecoration(labelText: 'Task name'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(contextOfdialog);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await cubit.updateTask(
                      id: widget.task.id,
                      taskname: taskNameController.text.trim(),
                      description: descriptionController.text.trim(),
                      isdone: widget.task.isdone,
                    );

                    if (contextOfdialog.mounted) {
                      Navigator.pop(contextOfdialog);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: Units.width(context, 30)),
            height: Units.height(context, 200),
            decoration: BoxDecoration(
              color: ColorManager.ColorNeutralWhite,
              borderRadius: BorderRadius.circular(Units.radius(context, 12)),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.ColorNeutralPrimary.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Units.width(context, 30)),
            height: Units.height(context, 55),
            decoration: BoxDecoration(
              color: ColorManager.ColorBrandprimaryDefault,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Units.radius(context, 12)),
                topRight: Radius.circular(Units.radius(context, 12)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Units.width(context, 70),
              top: Units.height(context, 85),
            ),
            width: Units.width(context, 32),
            height: Units.height(context, 32),
            decoration: BoxDecoration(
              color: ColorManager.ColorBrandprimaryDefault,
              borderRadius: BorderRadius.circular(Units.radius(context, 7)),
            ),
            child: Checkbox(
              value: widget.task.isdone,
              checkColor: ColorManager.ColorBrandprimaryDefault,
              onChanged: (value) async {
                final con = context.read<HomeCubit>();

                if (!mounted) return;

                setState(() {
                  isdone = value!;
                });

                await con.updateTask(
                  id: widget.task.id,
                  description: widget.task.description,
                  isdone: value!,
                  taskname: widget.task.taskname,
                );
              },
              fillColor: WidgetStateProperty.all(
                ColorManager.ColorNeutralWhite,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: Units.width(context, 120),
                  top: Units.height(context, 90),
                ),
                child: Text(
                  widget.task.taskname,
                  style: TextStyle(
                    fontSize: Units.font(context, 13),
                    color: ColorManager.ColorNeutralPrimary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final con = context.read<HomeCubit>();
                  await con.deleTask(id: widget.task.id);
                  await con.getTasks();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: Units.height(context, 90),
                    left: Units.width(context, 130),
                  ),
                  child: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: Units.width(context, 50),
              right: Units.width(context, 50),
              top: Units.height(context, 137),
            ),
            height: 1,
            color: ColorManager.ColorNeutralLine,
          ),
          Container(
            margin: EdgeInsets.only(
              left: Units.width(context, 50),
              top: Units.height(context, 153),
            ),
            child: Text(
              widget.task.description,
              style: TextStyle(
                fontSize: Units.font(context, 16),
                color: ColorManager.ColorNeutralSecondary,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: Units.width(context, 50),
              top: Units.height(context, 160),
            ),
            alignment: Alignment.centerRight,
            child: Text(
              DateTime.now().toString(),
              style: TextStyle(
                fontSize: Units.font(context, 12),
                color: ColorManager.ColorNeutralSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
