import 'package:balance_her/resources/resources.dart';
import 'package:balance_her/ui/screens/tabs/tabs.dart';
import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.primaryColor});

  final Color primaryColor;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> _taskCategories = ['Work', 'Meetings', 'Home'];
  final List<String> _taskDurationTypes = ['Daily', 'Weekly'];

  @override
  Widget build(BuildContext context) {
    final selectedTaskTypeIndex = context
        .select<MainScreenViewModel, int>((value) => value.taskTypeIndex);
    final selectedTaskDurationIndex = context
        .select<MainScreenViewModel, int>((value) => value.taskDurationIndex);
    final model = context.read<MainScreenViewModel>();
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'Main',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(Images.homeTab)),
            _TaskTypeChipRow(
              changeableValue: selectedTaskTypeIndex,
              chipTypes: _taskCategories,
              onSelected: model.setTaskTypeIndex,
            ),
            _TasksProgressBar(
                taskType: _taskCategories[selectedTaskTypeIndex],
                taskDuration: _taskDurationTypes[selectedTaskDurationIndex],
                completedTasksPercent: 0),
            Text(
              'Tasks',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.onPrimary),
            ),
            _TaskTypeChipRow(
              chipTypes: _taskDurationTypes,
              changeableValue: selectedTaskDurationIndex,
              onSelected: model.setTaskDurationIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class _TasksProgressBar extends StatelessWidget {
  const _TasksProgressBar({
    super.key,
    required this.taskType,
    required this.completedTasksPercent,
    required this.taskDuration,
  });

  final String taskType;
  final String taskDuration;
  final int completedTasksPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskType,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.secondary),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Complete ${taskDuration.toLowerCase()} tasks',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.onPrimary),
              ),
              Text(
                '$completedTasksPercent%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.onPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskTypeChipRow extends StatefulWidget {
  _TaskTypeChipRow(
      {super.key,
      required this.chipTypes,
      required this.changeableValue,
      this.onSelected});

  final List<String> chipTypes;
  int changeableValue;
  final void Function(int)? onSelected;

  @override
  State<_TaskTypeChipRow> createState() => _TaskTypeChipRowState();
}

class _TaskTypeChipRowState extends State<_TaskTypeChipRow> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(
        widget.chipTypes.length,
        (int index) {
          return _TaskTypeChip(
            selected: widget.changeableValue == index,
            label: widget.chipTypes[index],
            onSelected: (bool selected) {
              setState(() {
                widget.changeableValue = index;
                if (widget.onSelected != null) {
                  widget.onSelected!(index);
                }
                // model.setTaskTypeIndexIndex(index);
              });
            },
          );
        },
      ),
    );
  }
}

class _TaskTypeChip extends StatelessWidget {
  const _TaskTypeChip(
      {super.key,
      required this.selected,
      this.onSelected,
      required this.label});

  final bool selected;
  final ValueChanged<bool>? onSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    final chipTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: selected ? AppColors.surface : AppColors.onPrimary);
    return ChoiceChip(
      label: Text(
        label,
        style: chipTextStyle,
      ),
      selected: selected,
      onSelected: onSelected,
    );
  }
}
