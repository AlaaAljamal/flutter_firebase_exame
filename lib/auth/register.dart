import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../FireResponseClass.dart';
import '../controller/firestorecontroller.dart';
import '../myuser.dart';
import '../sharedprefernces/sharedpref.dart';
import 'login.dart';
import '../controller/Firebasecontroller.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
   late TextEditingController _NameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

   MyUser get user {
    MyUser myUser = MyUser();
    myUser.name = _NameTextController.text;
    myUser.id = SharedPrefController().getData<String>(key: "token") ?? '';
    myUser.email = _emailTextController.text;
    myUser.password = _passwordTextController.text;
    return myUser;
  }
  

  @override
  void initState() {
    super.initState();
    _NameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
     _NameTextController.dispose();
     _emailTextController.dispose();
     _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: 
          [Container(
            height: 800,
            width: 400,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image.png'),fit: BoxFit.fill)),
            child: Column(children: [
              Padding(
              padding: const EdgeInsets.only(top: 110,bottom: 5,right: 200),
              child: Text('Create new ',style: TextStyle(fontSize:25,fontWeight: FontWeight.w400 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 30,right: 250),
              child: Text('Accout',style: TextStyle(fontSize:25,fontWeight: FontWeight.w400 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30,right: 180),
              child: Text('''Please type full information below and we can create your account''',style: TextStyle(fontSize:14,fontWeight: FontWeight.w300 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25,left: 25,bottom:25 ),
              child: TextField(
                controller:_NameTextController ,
                decoration: InputDecoration( 
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Icons.email,),
                  prefixIconColor: Color(0xffD3D5DA),
                  label:Text('Full Name') ,
                  labelStyle: TextStyle(backgroundColor: Color(0xffFFFFFF),color: Color(0xffFF9801),fontSize: 13),
                  border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(gapPadding: 10,
                      borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xffFF9801)),
                    ) ,
                  )
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25,left: 25,bottom:25 ),
              child: TextField(
                controller: _emailTextController,
                decoration: InputDecoration( 
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Icons.email,),
                  prefixIconColor: Color(0xffD3D5DA),
                  label:Text('Email Address') ,
                  labelStyle: TextStyle(backgroundColor: Color(0xffFFFFFF),color: Color(0xffFF9801),fontSize: 13),
                  border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(gapPadding: 10,
                      borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xffFF9801)),
                    ) ,
                  )
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25,left: 25,bottom: 30),
              child: TextField(
                controller: _passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.remove_red_eye),
                  suffixIconColor: Color(0xffD3D5DA),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Color(0xffD3D5DA),
                  label:Text('Password') ,
                  labelStyle: TextStyle(backgroundColor: Color(0xffFFFFFF),color: Color(0xff121826),fontSize: 15),
                  border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  )
                ),
            ),
            InkWell(onTap: () async => await _performRegister(),
              child: Container(alignment: Alignment.center,
                child: Text('register',style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18)),
                decoration: BoxDecoration(color: Color(0xffFF9801),borderRadius: BorderRadius.circular(20)),
                width: 320,
                height: 60,
                ),
            ),
               Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text('Or connect with',style: TextStyle(fontSize:14,fontWeight: FontWeight.w300 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 25,left: 25),
              child: Container(
                height: 55,
                width: 330,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Image.asset('assets/google.png') ,
                    ),
                ],),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 100,top: 30),
              child: Row(children: [
                Text('Already have an account?',style: TextStyle(fontSize:14,fontWeight: FontWeight.w300 ),),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
               return login();
             },));
                },
                  child: Text('Sign in',style: TextStyle(color: Color(0xffFF9801),fontWeight: FontWeight.bold,),)),
              ],),
            )
            ],),
          ),
        ],
      ),
    );
  }

   Future<void>_performRegister()async{
    if(_chekData()){
      await _register();
    }
   }

   bool _chekData(){
    if(_NameTextController.text.isNotEmpty&&
       _emailTextController.text.isNotEmpty&&
       _passwordTextController.text.isNotEmpty ){
        return true ;
       }
       return false ;
   }



    
     Future<void> _register() async {
    FireResponseClass b = await FireBaseController().register(email: _emailTextController.text,password: _passwordTextController.text);
     if(b.status){
      FireStoreController().newUser(user: user);
      Get.off(()=>login());
     }
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(b.message)));
 }

}