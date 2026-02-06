import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class MonthCalendar extends StatelessWidget {
  final DateTime currentMonth;
  final DateTime? selectedDate;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final ValueChanged<DateTime> onPickDate;

  const MonthCalendar({
    super.key,
    required this.currentMonth,
    required this.selectedDate,
    required this.onPrev,
    required this.onNext,
    required this.onPickDate,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final daysInMonth = DateTime(
      currentMonth.year,
      currentMonth.month + 1,
      0,
    ).day;

    final weekStartOffset = (firstDay.weekday % 7);

    final totalCells = weekStartOffset + daysInMonth;
    final rows = (totalCells / 7).ceil();

    String monthLabel() {
      const months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      return '${months[currentMonth.month - 1]} ${currentMonth.year}';
    }

    Widget dayHeader(String t) => Expanded(
      child: Center(
        child: Text(
          t,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.maincolor3),
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: AppDimensions.radius12,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  monthLabel(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                onPressed: onPrev,
                icon: Icon(Icons.chevron_left, color: AppColors.black),
              ),
              IconButton(
                onPressed: onNext,
                icon: Icon(Icons.chevron_right, color: AppColors.black),
              ),
            ],
          ),

          SizedBox(height: AppDimensions.height10),

          Row(
            children: [
              dayHeader('Sun'),
              dayHeader('Mon'),
              dayHeader('Tue'),
              dayHeader('Wed'),
              dayHeader('Thu'),
              dayHeader('Fri'),
              dayHeader('Sat'),
            ],
          ),

          SizedBox(height: AppDimensions.height10),
          Column(
            children: List.generate(rows, (r) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.height10),
                child: Row(
                  children: List.generate(7, (c) {
                    final cell = r * 7 + c;
                    final dayNumber = cell - weekStartOffset + 1;

                    if (dayNumber < 1 || dayNumber > daysInMonth) {
                      return Expanded(
                        child: SizedBox(height: AppDimensions.height30),
                      );
                    }

                    final date = DateTime(
                      currentMonth.year,
                      currentMonth.month,
                      dayNumber,
                    );

                    final isSelected =
                        selectedDate != null &&
                        selectedDate!.year == date.year &&
                        selectedDate!.month == date.month &&
                        selectedDate!.day == date.day;

                    return Expanded(
                      child: InkWell(
                        onTap: () => onPickDate(date),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius8,
                        ),
                        child: Container(
                          height: AppDimensions.height30,
                          margin: EdgeInsets.all(AppDimensions.width5),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius8,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '$dayNumber',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.black,
                                fontWeight: isSelected
                                    ? FontWeight.w800
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
