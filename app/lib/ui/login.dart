import 'package:app/service/device/session_service.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        padding: EdgeInsets.all(25.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'ACME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                LoginForm(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final FocusNode _passwordField = FocusNode();
  final _passwordController = TextEditingController();

  _login() {
    if (_formKey.currentState.validate()) {
      saveEmail(_emailController.text);
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Indica un email';
              }
            },
            textInputAction: TextInputAction.next,
            onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordField),
          ),
          TextFormField(
            controller: _passwordController,
            focusNode: _passwordField,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            keyboardType: TextInputType.text,
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Indica un password';
              }
            },
            textInputAction: TextInputAction.send,
            onEditingComplete: _login,
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.lightBlue,
            textColor: Colors.white,
            child: Text('Login'),
            onPressed: _login,
          ),
        ],
      ),
    );
  }
}
