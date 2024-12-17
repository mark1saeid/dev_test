import 'package:dev_test/core/helpers/colors.dart';
import 'package:dev_test/core/helpers/methods.dart';
import 'package:flutter/material.dart';
import 'package:calendar_day_slot_navigator/calendar_day_slot_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarWidget extends StatelessWidget {
  final Function(DateTime)? onCalendarChanged;

  const CalendarWidget({
    super.key,
    this.onCalendarChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarDaySlotNavigator(
      slotLength: 5,
      dayBoxHeightAspectRatio: 4.5,
      dayDisplayMode: DayDisplayMode.inDateBox,
      activeColor: mainColor,
      deActiveColor: const Color(0xffffffff),
      monthYearTabBorderRadius: 15,
      dayBoxBorderRadius: 10,
      headerText: formatToMonthYear(DateTime.now()),
      onDateSelect: (selectedDate) {},
      dateSelectionType: DateSelectionType.deActiveRangeDates,
      fontFamilyName: "Lato",
      isGoogleFont: true,
      dayBorderWidth: 0.5.w,
    );
  }
}
