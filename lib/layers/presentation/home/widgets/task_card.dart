import 'package:dev_test/layers/data/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;

  const TaskCard({
    super.key,
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(taskModel.startDate.format(context),
                  style: const TextStyle(fontSize: 16)),
              SizedBox(height: 0.15.sh),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 0.12.sh,
                  decoration: BoxDecoration(
                    color: taskModel.color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: taskModel.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(taskModel.taskName,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 5),
                        Text(
                            "${taskModel.startDate.format(context)} - ${taskModel.endDate.format(context)}",
                            style: const TextStyle(fontSize: 16)),
                        SizedBox(height: 0.03.sh),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
