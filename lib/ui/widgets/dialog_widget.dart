import 'dart:developer';

import 'package:balance_her/ui/screens/tabs/tabs.dart';
import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    log('tab controller initialized');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.removeListener(getTabIndex);
    _tabController.dispose();
    log('tab controller disposed');
    super.dispose();
  }

  void getTabIndex() {
    final index = _tabController.index;
    log('tab index: $index');
    context.read<MainScreenViewModel>().taskTypeTabIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(getTabIndex);
    final model = context.read<MainScreenViewModel>();
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      backgroundColor: AppColors.background,
      title: const _DialogTitle(),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _TaskTypeTabBar(
              controller: _tabController,
              categories: model.taskCategories,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: _TaskNameInputField(),
            ),
            const _TaskDatePicker(),
          ],
        ),
      ),
      actions: const <Widget>[
        _DialogActionButton(),
      ],
    );
  }
}

class _DialogTitle extends StatelessWidget {
  const _DialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
            constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
            child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 20,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.outline8),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close_rounded)),
          ),
        ],
      ),
    );
  }
}

class _TaskTypeTabBar extends StatelessWidget {
  const _TaskTypeTabBar(
      {super.key, required this.controller, required this.categories});

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

class _TaskNameInputField extends StatelessWidget {
  const _TaskNameInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return SizedBox(
      width: double.maxFinite,
      child: TextField(
        controller: model.taskNameController,
        maxLines: null,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.secondary),
        textAlign: TextAlign.center,
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
      ),
    );
  }
}

class _TaskDatePicker extends StatelessWidget {
  const _TaskDatePicker({super.key});

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
            side: const WidgetStatePropertyAll(BorderSide.none),
            backgroundColor: const WidgetStatePropertyAll(AppColors.outline8),
            // fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          ),
        ),
      ],
    );
  }
}

class _DialogActionButton extends StatelessWidget {
  const _DialogActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return SizedBox(
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
          backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
        ),
        child: Text(
          'Save',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.surface),
        ),
        onPressed: () {
          log('save button pressed');
          model.saveTask();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
