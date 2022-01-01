import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
   // UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
     //   email: email, password: password);
  User? user = (await _auth.createUserWithEmailAndPassword(
    email: email, password: password))
    .user;
    //print("Account created Succesfull");
    
    //userCrendetial.user!.updateDisplayName(name);
  if(user!= null){
    print('succesfull');
    return user;
  } else {
    print('fail');
    return user;
  }
  } catch(e){
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
 // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
    email: email, password: password))
    .user;
    //print("Account created Succesfull");
    
    //userCrendetial.user!.updateDisplayName(name);
  if(user!= null){
    print('login succesfull');
    return user;
  } else {
    print('login fail');
    return user;
  }
  } catch(e){
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
   await _auth.signOut().then((value){
     Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
   });

}catch(e){
  print(e);
}
}
