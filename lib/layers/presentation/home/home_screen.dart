import 'package:dev_test/core/helpers/colors.dart';
import 'package:dev_test/layers/presentation/create/create_screen.dart';
import 'package:dev_test/layers/presentation/home/cubit/home_cubit.dart';
import 'package:dev_test/layers/presentation/home/widgets/calender.dart';
import 'package:dev_test/layers/presentation/home/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit? cubit;
  @override
  void initState() {
    cubit = HomeCubit.get(context);
    super.initState();
  }

  @override
  void dispose() {
    cubit = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.grey.shade300),
            const SizedBox(width: 10),
            const Text('Profile Name'),
            const Spacer(),
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CalendarWidget(),
                ),
                SliverList.builder(
                    itemCount: cubit!.tasks.length,
                    itemBuilder: (context, index) => TaskCard(
                          taskModel: cubit!.tasks[index],
                        ))
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMaterialModalBottomSheet(
            bounce: true,
            expand: true,
            useRootNavigator: true,
            context: context,
            builder: (context) => const CreateTaskScreen(),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: mainColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
