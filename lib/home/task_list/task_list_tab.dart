import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_alex_c7/firebase_utils.dart';
import 'package:flutter_todo_app_alex_c7/home/task_list/item_task_list_widget.dart';
import 'package:flutter_todo_app_alex_c7/list_provider/list_provider.dart';
import 'package:flutter_todo_app_alex_c7/model/task.dart';
import 'package:flutter_todo_app_alex_c7/my_theme.dart';
import 'package:provider/provider.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
      listProvider.getAllTaskFromFireStore();

    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: listProvider.selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              listProvider.changeSelectedDate(date);
            }, // logic
            leftMargin: 20,
            monthColor: MyThemeData.blackColor,
            dayColor: MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryLightColor,
            dotsColor: MyThemeData.whiteColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemTaskListWidget(
                  task: listProvider.taskList[index],
                );
              },
              itemCount: listProvider.taskList.length,
            ),
          )
        ],
      ),
    );
  }

}
