import 'package:dev_test/layers/data/task_model.dart';
import 'package:dev_test/layers/presentation/create/cubit/create_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChip extends StatelessWidget {
  final Color color;
  final Category category;
  const CategoryChip(
    this.category,
    this.color, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CreateCubit.get(context).changeCategory(category, color);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
            border: CreateCubit.get(context).category == category
                ? Border.all(color: Colors.black)
                : null,
            color: color,
            borderRadius: BorderRadius.circular(15.r)),
        child: Text(
          category.name,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
