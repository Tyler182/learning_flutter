import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);
  @override
  State<RegisterFormPage> createState() => RegisterFormPageState();
}

class RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Form Page'),
          centerTitle: true,
        ),
        body: Form(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Surname Name',
                  helperText: 'Only Surname and Name',
                  labelText: 'Full Name*',
                  suffixIcon: Icon(Icons.delete_outline),
                  suffixIconColor: Colors.red,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.phone,
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                // ],
                maxLength: 16,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  helperText: 'Phone we can call you',
                  suffixIcon: Icon(Icons.delete_outline),
                  suffixIconColor: Colors.red,
                  labelText: 'Phone Number',
                  hintText: '+x(xxx)xxx-xx-xx',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Surname Name',
                  helperText: 'Only Surname and Name',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Life Story',
                  hintText: 'Tell us about yourselve',
                  helperText: 'Keep it short',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        // color: Colors.black,
                        // width: 2,
                        ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      // width: 2,
                    ),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: _hidePass,
                maxLength: 12,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                    icon: _hidePass
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                  hintText: 'Enter password',
                  helperText: 'Symbols, numbers, special characters',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: _hidePass,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.border_color),
                  hintText: 'Enter passwords',
                  helperText: 'Same as in field password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                    icon: _hidePass
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: (() {}),
                child: const Text('Submit Form'),
              ),
            ],
          ),
        ));
  }
}
