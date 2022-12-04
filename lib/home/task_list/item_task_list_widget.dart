import 'package:flutter/material.dart';
import 'package:flutter_todo_app_alex_c7/my_theme.dart';

class ItemTaskListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 18),
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
              Text('Task Title',
                style: Theme.of(context).primaryTextTheme.headline2,
              ),
              Text('Description',
                style: Theme.of(context).primaryTextTheme.subtitle2,

              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 21),
            decoration: BoxDecoration(
              color: MyThemeData.primaryLightColor,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Icon(Icons.check,size: 40,color: MyThemeData.whiteColor),
          ),
        ],
      ),
    );
  }
}
