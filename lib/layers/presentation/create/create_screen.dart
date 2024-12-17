import 'package:dev_test/core/helpers/colors.dart';
import 'package:dev_test/core/helpers/methods.dart';
import 'package:dev_test/layers/data/task_model.dart';
import 'package:dev_test/layers/presentation/create/cubit/create_cubit.dart';
import 'package:dev_test/layers/presentation/create/widgets/category_chip.dart';
import 'package:dev_test/layers/presentation/create/widgets/priority_chip_widget.dart';
import 'package:dev_test/layers/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder(
          bloc: CreateCubit.get(context),
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Task",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    onChanged: (value) {
                      CreateCubit.get(context).changeTaskName(value);
                    },
                    decoration: const InputDecoration(
                      labelText: "Task name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  GestureDetector(
                    onTap: () {
                      selectTime(context).then((value) {
                        CreateCubit.get(context).changeStartTime(value);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: greyColor,
                        ),
                        Text("Start",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15.sp)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.22.sw, vertical: 0.012.sh),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black)),
                          child: Text(
                            CreateCubit.get(context).startTime.format(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectTime(context).then((value) {
                        CreateCubit.get(context).changeStartTime(value);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: greyColor,
                        ),
                        Text("End",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15.sp)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.22.sw, vertical: 0.012.sh),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(
                                  width: 0.5.w, color: Colors.black)),
                          child: Text(
                            CreateCubit.get(context).endTime.format(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Priority Section
                  const Text("Priority"),
                  SizedBox(height: 8.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PriorityChip(Priority.low, Colors.green),
                      PriorityChip(Priority.medium, Colors.yellow),
                      PriorityChip(Priority.high, Colors.red),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const Text("Categories"),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      CategoryChip(Category.work, Colors.blue[100]!),
                      SizedBox(width: 8.w),
                      CategoryChip(Category.personal, Colors.purple[100]!),
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 12.h),
                          backgroundColor: Colors.grey[300],
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          HomeCubit.get(context).addTask(TaskModel(
                              taskName: CreateCubit.get(context).taskName,
                              startDate: CreateCubit.get(context).startTime,
                              endDate: CreateCubit.get(context).endTime,
                              priorty: CreateCubit.get(context).priority,
                              category: CreateCubit.get(context).category,
                              color: CreateCubit.get(context).color));
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 12.h),
                          backgroundColor: mainColor,
                        ),
                        child: const Text(
                          "Create Task",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
