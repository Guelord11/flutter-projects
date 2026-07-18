import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  String? _name, _email, _password;
  File? _image;

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _profileImageWidget(),
                _registrationForm(),
                _registerButton(),
              ],
          ),
      ),
    )));
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

  Widget _registrationForm() {
    return Container(
      height: _deviceHeight! * 0.30,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            _emailText(),
            _passwordText(),
          ],
        ),
      ),
    );
  }

  Widget _profileImageWidget(){
    var _imageProvider = _image != null ? FileImage(_image!) : const NetworkImage('https://i.pravatar.cc/300');
    return GestureDetector(
      onTap: () {
        FilePicker.pickFiles(type: FileType.image).then((_result) {
          setState(() {
            _image = File(_result!.files.first.path!);
          });
        });
      },
      child : Container(
      height: _deviceHeight! * 0.15,
      width: _deviceWidth! * 0.40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _imageProvider as ImageProvider,
          fit: BoxFit.cover,
        ),
      ))
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: 'Enter your name',
      ),
      validator: (_value) => _value!.isEmpty ? 'Name cannot be empty' : null,
      onSaved: (_value) {
        setState(() {
          _name = _value;
        });
      },
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
        bool _result = _value!.contains(
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        );
        return _result ? null : 'Please enter a valid email';
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
      validator: (_value) => _value!.length > 6 
        ? null : 'Password must be at least 6 characters long'
    );
  }

  Widget _registerButton() {
    return MaterialButton(
      onPressed: _registerUser,
      minWidth: _deviceWidth! * 0.5,
      height: _deviceHeight! * 0.05,
      color: Colors.red,
      child: const Text('Register', style: TextStyle(
        color: Colors.white, 
        fontSize: 20, 
        fontWeight: FontWeight.w400
        ),),
    );
  }

  void _registerUser() {
    if (_registerFormKey.currentState!.validate() && _image != null) {
      _registerFormKey.currentState!.save();
    }
  }
}