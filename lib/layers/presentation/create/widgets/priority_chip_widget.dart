import 'package:dev_test/core/helpers/colors.dart';
import 'package:dev_test/layers/data/task_model.dart';
import 'package:dev_test/layers/presentation/create/cubit/create_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriorityChip extends StatelessWidget {
  final Priority priority;
  final Color color;
  const PriorityChip(
    this.priority,
    this.color, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CreateCubit.get(context).changePriority(priority);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
            border: CreateCubit.get(context).priority == priority
                ? Border.all(color: Colors.black)
                : null,
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 8,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              priority.name,
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
