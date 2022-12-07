import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app_alex_c7/model/task.dart';

CollectionReference<Task> getTaskCollection(){
   return FirebaseFirestore.instance.collection('task')
      .withConverter<Task>(
      fromFirestore: ((snapshot, options) => Task.fromJson(snapshot.data()!)),
      toFirestore: (task,options)=> task.toJson());
}

Future<void> addTaskToFireStore(Task task) {
  var collection = getTaskCollection();  // collection
  var docRef = collection.doc();  // document
  task.id =  docRef.id ; // auto generate
  return docRef.set(task);
}