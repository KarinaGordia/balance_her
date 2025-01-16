import 'package:balance_her/resources/resources.dart';
import 'package:balance_her/ui/screens/tabs/tabs.dart';
import 'package:balance_her/ui/theme/theme.dart';
import 'package:balance_her/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
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
        title: const Text('Main'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(Images.homeTab)),
            const SizedBox(height: 8),
            _TaskTypeChipRow(
              chipTypes: _taskCategories,
              changeableValue: selectedTaskTypeIndex,
              onSelected: model.setTaskTypeIndex,
            ),
            const SizedBox(height: 8),
            _TasksProgressBar(
                taskType: _taskCategories[selectedTaskTypeIndex],
                taskDuration: _taskDurationTypes[selectedTaskDurationIndex],
                completedTasksPercent: 0),
            const SizedBox(height: 8),
            Text(
              'Tasks',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.onPrimary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TaskTypeChipRow(
                  chipTypes: _taskDurationTypes,
                  changeableValue: selectedTaskDurationIndex,
                  onSelected: model.setTaskDurationIndex,
                ),
                _AddTaskButton(categories: _taskCategories,),
              ],
            ),
            const _TaskList(
              tasks: [],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddTaskButton extends StatelessWidget {
  const _AddTaskButton({super.key, required this.categories});

  final List<String> categories;
  Future<void> _showAddTaskDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AddTaskDialog(categories: categories,);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.read<MainScreenViewModel>().primaryColor;
    return FilledButton(
      onPressed: () => _showAddTaskDialog(context),
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10),
        ),
        visualDensity: const VisualDensity(vertical: -1.5),
        backgroundColor: WidgetStatePropertyAll(primaryColor),
      ),
      child: Text(
        'Add task',
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.surface),
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
    final primaryColor = context.read<MainScreenViewModel>().primaryColor;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            taskType,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.secondary),
          ),
          LinearProgressIndicator(
            backgroundColor: AppColors.outline8,
            color: primaryColor,
            borderRadius: BorderRadius.circular(16),
            minHeight: 8,
            value: completedTasksPercent / 100,
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

class _TaskList extends StatelessWidget {
  const _TaskList({super.key, required this.tasks});

  final List<String> tasks;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(
        child:  EmptyTabBanner(
          imagePath: Images.home,
          message:
          'You don\'t have any tasks added,\nadd a task and it will appear here.',
        ),
      );
    }

    return Expanded(
      child: ListView(
        children: List.generate(30, (index) {
          return Container(
            height: 30,
            color: index%2==0 ? Colors.purple : Colors.grey,
          );
        }),

      ),
    );
  }
}
