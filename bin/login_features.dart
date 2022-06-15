import 'dart:io';

import 'package:login_features/login_features.dart' as login_features;

import 'services/verification.dart';

var vef = Verification();

void main() {

  showSignUp();

}

// Interface

void showSignUp() {

  print("=============================================================");
  print("SIGN UP");
  print("=============================================================");

  stdout.write("Username : ");
  String? id = stdin.readLineSync();

  stdout.write("Password : ");
  String? password = stdin.readLineSync();

  vef.signUp(id!, password!);

  showSignIn();

}

void showSignIn() {

  print("=============================================================");
  print("SIGN IN");
  print("=============================================================");

  stdout.write("Id : ");
  dynamic id = stdin.readLineSync();

  stdout.write("Password : ");
  String? password = stdin.readLineSync();

  try {
    id = int.parse(id!);
  } catch(e){}

  var result = vef.signIn(id!, password!);

  if(result) {
    showHomepage();
  } else {
    print("Failed to login...");
    showSignUp();
  }

}

void showHomepage() {

  while(true) {

    print("x. Sign Out");

    print("=============================================================");

    stdout.write("Option : ");
    String option = stdin.readLineSync()!;

    switch(option) {
      case "x" :
        showSignUp();
        break;
    }
  }

}
