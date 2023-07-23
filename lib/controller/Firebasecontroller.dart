import 'package:firebase_auth/firebase_auth.dart';

import '../FireResponseClass.dart';
import '../sharedprefernces/sharedpref.dart';

class FireBaseController{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



   Future<FireResponseClass>login({email,password}) async {
    try{
     UserCredential  userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     if(userCredential.user != null){
       SharedPrefController().setData(Key: "token",value: userCredential.user!.uid );
     
      if(userCredential.user!.emailVerified){
        return FireResponseClass(status: true,message: 'done');
      }else{
        userCredential.user!.sendEmailVerification();
        return  FireResponseClass(status: false,message: 'your email not virified');
      }
     }
     return FireResponseClass(status: false,message: 'something wrong');
    }on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    return FireResponseClass(status: false,message: 'No user found for that email');
  } else if (e.code == 'wrong-password') {
    return FireResponseClass(status: false,message: 'Wrong password provided for that user');
  }else if (e.code == 'wrong-email') {
     return FireResponseClass(status: false,message: 'Wrong email provided for that user');
  }else {
    return FireResponseClass(status: false,message: 'something wrong');
   }
  }
 }





  Future<FireResponseClass>register({email,password}) async {
    return await firebaseAuth 
    .createUserWithEmailAndPassword(email: email, password: password)
    .then((value){
      value.user!.sendEmailVerification();
      SharedPrefController().setData(Key: "token",value: value.user!.uid );
      return FireResponseClass(status: true, message: 'virify your email');
    }).onError((error, stackTrace) => FireResponseClass(status: false, message: 'something error'));
  }



  resetpassword({email}) async {
    try{
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return FireResponseClass(status: true, message: 'done');
    }on FirebaseAuthException catch (e) {
      if(e.code == 'invalid-email'){
        return FireResponseClass(status: false, message: 'invalid-email');
      }else{
         return FireResponseClass(status: false, message: e.message!);
      }
    }  
  }



  deletUser(){
    firebaseAuth.currentUser!.delete();
  }


}