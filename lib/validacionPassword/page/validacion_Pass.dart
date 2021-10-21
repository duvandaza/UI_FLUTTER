import 'package:flutter/material.dart';

class ValidacionPassPage extends StatefulWidget {

  @override
  _ValidacionPassPageState createState() => _ValidacionPassPageState();
}

class _ValidacionPassPageState extends State<ValidacionPassPage> {
  
  bool _isVisible = false;
  bool _passwordCaracter = false;
  bool _passwordNumero = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Crea Tu Contraseña', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Escribe una contraseña', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 30,),
            Text('Por favor crea una contraseña segura siguiendo los criterios a continuación.',
            style: TextStyle(fontSize: 16, height: 1.5, color: Colors.grey.shade700) ),
            SizedBox(height: 30,),
            TextField(
              onChanged: (password) => passwordChange(password),
              obscureText: !_isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _isVisible = !_isVisible;                      
                    });
                  },
                  icon: !_isVisible ? Icon(Icons.visibility, color: Colors.black,) 
                  : Icon(Icons.visibility_off, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20) 
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: _passwordCaracter ? Colors.green : Colors.transparent,
                    border: _passwordCaracter ? Border.all(color: Colors.transparent) : 
                    Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                ),
                SizedBox(width: 10,),
                Text('Contener al menos 8 caracteres')
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: _passwordNumero ? Colors.green : Colors.transparent,
                    border: _passwordNumero ? Border.all(color: Colors.transparent) : 
                    Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                ),
                SizedBox(width: 10,),
                Text('Contener al menos 1 numero')
              ],
            ),
            SizedBox(height: 40,),
            MaterialButton(
              height: 40,
              minWidth: double.infinity,
              onPressed: (){},
              color: Colors.black,
              child: Text('Crear Cuenta', style: TextStyle( color: Colors.white ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
            )
          ],
        ),
      ),
    );
  }

  passwordChange(String password){
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _passwordCaracter = false;
      if(password.length >= 8) 
        _passwordCaracter = true;
      
      _passwordNumero = false;
      if(numericRegex.hasMatch(password))
      _passwordNumero = true; 
    });
  }
}