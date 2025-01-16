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

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final List<String> _taskCategories = ['Work', 'Meetings', 'Home'];
  final List<String> _taskDurationTypes = ['Daily', 'Weekly'];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _showAddTaskDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          titlePadding: const EdgeInsets.all(16),
          actionsPadding: const EdgeInsets.all(16),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          backgroundColor: AppColors.background,
          title: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add task',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.onSecondaryDark),
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 36, maxWidth: 36),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.outline8),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close_rounded)),
                ),
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _TaskTypeTabBar(
                  controller: _tabController,
                  categories: _taskCategories,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: TaskNameInputField(),
                ),
                const TaskDatePicker(),
              ],
            ),
          ),
          actions: <Widget>[
            SizedBox(
              height: 46,
              width: double.maxFinite,
              child: TextButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // side: WidgetStatePropertyAll(BorderSide.none),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.primary),
                ),
                child: Text(
                  'Save',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.surface),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.read<MainScreenViewModel>().primaryColor;
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
            _TaskTypeChipRow(
              chipTypes: _taskCategories,
              changeableValue: selectedTaskTypeIndex,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TaskTypeChipRow(
                  chipTypes: _taskDurationTypes,
                  changeableValue: selectedTaskDurationIndex,
                  onSelected: model.setTaskDurationIndex,
                ),
                FilledButton(
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
                ),
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

class _TaskTypeTabBar extends StatelessWidget {
  const _TaskTypeTabBar({super.key, required this.controller, required this.categories});

  final TabController controller;
  final List<String> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.outline8,
      ),
      child: TabBar(
        controller: controller,
        tabs: List.generate(
          categories.length,
              (index) => Tab(text: categories[index]),
        ),
      ),
    );
  }
}

class TaskNameInputField extends StatelessWidget {
  const TaskNameInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.outline8,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          label: Center(
            child: Text(
              'Task name',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.onPrimary,
                  ),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        ),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.secondary),
      ),
    );
  }
}

class TaskDatePicker extends StatelessWidget {
  const TaskDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Date',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        FilledButton.icon(
          onPressed: () {},
          label: Text(
            '15.01.2025',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.secondary),
          ),
          icon: const Icon(
            Icons.calendar_month,
            color: AppColors.primary,
          ),
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            side: WidgetStatePropertyAll(BorderSide.none),
            backgroundColor: WidgetStatePropertyAll(AppColors.outline8),
            // fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          ),
        ),
      ],
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({super.key, required this.tasks});

  final List<String> tasks;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (tasks.isEmpty)
            const EmptyTabBanner(
              imagePath: Images.home,
              message:
                  'You don\'t have any tasks added,\nadd a task and it will appear here.',
            ),
        ],
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
