import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.05,
          ),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleWidget(),
              _loginForm(),
              _loginButton(),],
          ),),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      'Finstagram',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _loginForm(){
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _emailText(),
          _passwordText(),
        ],
      ),)
    );
  }

  Widget _emailText(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email'
        ),
        onSaved: (_value) {
          setState(() {
            _email = _value;
          });
        },
      validator: (_value) {
        _value!.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")) ? null : 'Please enter a valid email';
      },
    );
  }

  Widget _passwordText(){
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password'
        ),
        onSaved: (_value) {
          setState(() {
            _password = _value;
          });
        },
      validator: (_value) {
        _value!.length >= 6 ? null : 'Password must be at least 6 characters';
      },
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _deviceWidth! * 0.70,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ), 
    );
  }
}