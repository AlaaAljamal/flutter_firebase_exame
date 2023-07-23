import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../FireResponseClass.dart';
import '../myuser.dart';
import '../sharedprefernces/sharedpref.dart';
import 'Firebasecontroller.dart';

class FireStoreController{
   FirebaseFirestore  firebasefirestore  =  FirebaseFirestore.instance;
   newUser({required MyUser user}){
    firebasefirestore.collection('users').doc(user.id).set(user.toMap());
    // firebasefirestore.collection('users').add(user.toMap());
   }

   updateUser({required MyUser user}){
    try{
      firebasefirestore.collection('users').doc(user.id).update(user.toMap());
      return FireResponseClass(status: true, message: 'done');
    }on FirebaseException catch(e){
      return FireResponseClass(status: false, message: e.message!);
    }
   }

   deleteUser({id}){
    firebasefirestore.collection('users').doc(id).delete();
    FireBaseController().deletUser();
   }

   Future<MyUser>readUser() async {
   DocumentSnapshot snapshot = await firebasefirestore.collection('users')
   .doc(SharedPrefController().getData<String>(key:"token")).get();
   print(snapshot.data());
   return MyUser.fromMap(snapshot.data());
   }
   
  Future<List<MyUser>> readUsers() async {
   QuerySnapshot snapshot = await firebasefirestore.collection('users').get();
   print(snapshot.docs);
   return snapshot.docs.map<MyUser>((e) {
    return MyUser.fromMap(e.data());
   }).toList();
   }

     Stream<QuerySnapshot<Map<String,dynamic>>>  readUsersStreamly()async*{
     yield* firebasefirestore.collection('users').snapshots();
   }

}