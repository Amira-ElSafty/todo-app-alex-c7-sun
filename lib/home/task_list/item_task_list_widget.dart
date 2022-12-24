import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app_alex_c7/firebase_utils.dart';
import 'package:flutter_todo_app_alex_c7/model/task.dart';
import 'package:flutter_todo_app_alex_c7/my_theme.dart';

class ItemTaskListWidget extends StatelessWidget {
  Task task;
  ItemTaskListWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          extentRatio: 0.25,

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) {
                deleteTaskFromFireStore(task).timeout(Duration(milliseconds: 500),
                onTimeout: (){
                  print('task was deleted succussfully');
                });
              },
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              backgroundColor: MyThemeData.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: MyThemeData.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: MyThemeData.primaryLightColor,
                height: 60,
                width: 4,
              ),
              Column(
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                  Text(
                    task.description,
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 21),
                decoration: BoxDecoration(
                    color: MyThemeData.primaryLightColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(Icons.check, size: 40, color: MyThemeData.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
