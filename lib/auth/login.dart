import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_exame/home.dart';
import 'package:flutter_firebase_exame/auth/register.dart';
import 'package:get/get.dart';

import '../FireResponseClass.dart';
import '../controller/Firebasecontroller.dart';
import '../screen/buttom_nav.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: 
          [Container(
            height: 800,
            width: 400,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image.png'),fit: BoxFit.fill)),
            child: Column(children: [
              Padding(
              padding: const EdgeInsets.only(top: 110,bottom: 10),
              child: Text('blossom',style: TextStyle(fontSize:25,fontWeight: FontWeight.w400 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 30,),
              child: Text('beauty brand',style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30,right: 200),
              child: Text('please login to use the app',style: TextStyle(fontSize:14,fontWeight: FontWeight.w300 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 25,left: 25),
              child: TextField(
                controller:_emailTextController ,
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
              padding: const EdgeInsets.only(top: 20,right: 25,left: 25,bottom: 20),
              child: TextField(
                controller: _passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffix: Padding(padding: EdgeInsets.only(bottom: 20),
                    ),
                  suffixStyle: TextStyle(color: Color(0xffFF9801),fontSize: 13),
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
            InkWell(onTap: ()async => await _performlogin(),
              child: Container(alignment: Alignment.center,
                child: Text('Login',style: TextStyle(color: Color(0xffFFFFFF),fontSize: 15)),
                decoration: BoxDecoration(color: Color(0xffFF9801),borderRadius: BorderRadius.circular(20)),
                width: 320,
                height: 60,
                ),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text('Or connect with ',style: TextStyle(fontSize:14,fontWeight: FontWeight.w300 ),),
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
                Text('Dont’s have an account?',style: TextStyle(fontSize:14,fontWeight: FontWeight.w300 ),),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
               return register();
             },));
                },
                  child: Text('Sign up',style: TextStyle(color: Color(0xffFF9801),fontWeight: FontWeight.bold,),)),
              ],),
            )
            ],),
          ),
        ],
      ),
    );
  }


  Future<void>_performlogin()async{
    if(_chekData()){
      await _login();
    }
   }

   bool _chekData(){
    if(_emailTextController.text.isNotEmpty&&
       _passwordTextController.text.isNotEmpty&&
       _passwordTextController.text.length >=6&&
       _passwordTextController.text.length<=30){
        return true ;
       }
       return false ;
   }



    Future<void> _login() async {
      FireResponseClass b = await FireBaseController().login(email: _emailTextController.text,password: _passwordTextController.text);
     if(b.status){
      Get.offAll(()=>buttompage());
     }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(b.message)));
       }
       }  
}