import 'package:flutter/material.dart';
import 'package:flutter_todo_app_alex_c7/firebase_utils.dart';
import 'package:flutter_todo_app_alex_c7/model/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add new Task',
            style: Theme.of(context).primaryTextTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18,),
          Form(
            key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter task title'
                    ),
                    onChanged: (text){
                      title = text ;
                    },
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'Please enter task titie'; // invalid
                      }
                      return null;   // validate
                    },
                  ),
                  SizedBox(height: 18,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter task description'
                    ),
                    onChanged: (text){
                      description = text ;
                    },
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'Please enter task description';  // invalid
                      }
                      return null ;  // valid
                    },
                    minLines: 4,
                    maxLines: 4,
                  ),

                ],
              ) ),
          SizedBox(height: 18,),
          Text('Selecte Date',
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
          SizedBox(height: 18,),
          InkWell(
            onTap: (){
              // show calendar
              chooseDate();
            },
            child: Text('${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
              style: Theme.of(context).primaryTextTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 18,),
          ElevatedButton(
              onPressed: (){
                addTask();
              },
              child: Text('Add',
                style: Theme.of(context).primaryTextTheme.headline1,
              )
          )
        ],
      ),
    );
  }

  void chooseDate() async{
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if(chosenDate != null){
      selectedDate = chosenDate ;
      setState(() {

      });
    }
  }

  void addTask() {
    if(formKey.currentState?.validate() == true){
      // validate   add task
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch
      );
      addTaskToFireStore(task).timeout(
          Duration(milliseconds: 500),
          onTimeout:(){
            print('task was added successfully');
            Navigator.pop(context);
          } );
    }
  }


}
