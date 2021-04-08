import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/appmovilapp/generatedsignupviewwidget/generated/GeneratedIPhoneXRXSMax112Widget.dart';
import 'generated/GeneratedGroup3Widget.dart';

class userCreationGoogle extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Stack(
                children: [
                  Positioned(
                    child: GeneratedGroup3Widget(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text('''Información del usuario''',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 300,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: this.controllerName,
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter name";
                      }
                      return null;
                    },
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: this.controllerPhone,
                  decoration: InputDecoration(
                      labelText: "Phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter number";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      final form = _formKey.currentState;
                      form.save();
                      if (_formKey.currentState.validate()) {
                        print(FirebaseAuth.instance.currentUser);
                        GeneratedIPhoneXRXSMax112Widget()
                            .addUser(
                                FirebaseAuth.instance.currentUser.email,
                                this.controllerName.text,
                                FirebaseAuth.instance.currentUser.uid,
                                this.controllerPhone.text)
                            .then((value) => Navigator.pushNamed(
                                context, '/GeneratedWelcomeviewWidget'));
                      }
                    },
                    child: Text("Aceptar")),
              )
            ],
          )),
    );
  }
}
