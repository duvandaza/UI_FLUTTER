import 'dart:ffi';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter_verification_code/flutter_verification_code.dart';

class HomeOTPPage extends StatefulWidget {

  @override
  _HomeOTPPageState createState() => _HomeOTPPageState();
}


class _HomeOTPPageState extends State<HomeOTPPage> {

  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  Timer _timer;
  int _start = 60;

  Void resend(){

    setState(() {
      _isResendAgain = true;      
    });

    const onesec = Duration(seconds: 1);
    _timer = new Timer.periodic(onesec, (timer) { 
      setState(() {
         if(_start == 0){
           _start = 60;
           _isResendAgain = false;
           timer.cancel();
         }else{
           _start--;
         }     
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;      
    });

    const onesec = Duration(milliseconds: 10000);
    _timer = new Timer.periodic(onesec, (timer) { 
      setState(() {
        _isLoading = false;
        _isVerified = true; 
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade100
                ),
                child: Transform.rotate(
                  angle: 38,
                  child: Image(
                    image: AssetImage('assets/OTPAssets/email.png'),
                  ),
                ),
              ),
              SizedBox(height: 80,),
              Text('Verificación', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 30),
              Text('Please enter the 6 digit code sent to \n +57 323-356-0982',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500, height: 1.5),
              ),
              SizedBox(height: 30,),
              VerificationCode(
                length: 6,
                textStyle: TextStyle(fontSize: 20),
                underlineColor: Colors.blueAccent,
                keyboardType: TextInputType.number,
                onCompleted: (value){
                  setState(() {
                    _code = value;                    
                  });
                }, 
                onEditing: (value){},
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿No resiviste el mensaje?', style: TextStyle(fontSize: 14, color: Colors.grey.shade500),),
                  TextButton(
                    onPressed: (){
                      if(_isResendAgain) return;
                      resend();
                    },
                    child: Text( _isResendAgain ? 'Intetarlo de nuevo en ' + _start.toString() :'Reenviar',style: TextStyle(color: Colors.blueAccent),)
                  )
                ],
              ),
              SizedBox(height: 50,),
              MaterialButton(
                disabledColor: Colors.grey.shade300,
                onPressed: _code.length < 6 ? null : (){ verify(); },
                color: Colors.black,
                minWidth: double.infinity,
                height: 50,
                child: _isLoading ? Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 3,
                  ),
                )
                : _isVerified ? Icon(Icons.check_circle, color: Colors.white, size: 30,) : Text('Verificar', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}