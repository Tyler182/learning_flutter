import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);
  @override
  State<RegisterFormPage> createState() => RegisterFormPageState();
}

class RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final _nameFoxusNode = FocusNode();
  final _phoneFoxusNode = FocusNode();
  final _passFoxusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  List<String> _countries = ['Russia', 'Germany', 'France'];
  late String _selectedCountry;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _phoneController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFoxusNode.dispose();
    _phoneFoxusNode.dispose();
    _passFoxusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form Page'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              focusNode: _nameFoxusNode,
              autofocus: true,
              onFieldSubmitted: (str) {
                _changeFocus(context, _nameFoxusNode, _phoneFoxusNode);
              },
              controller: _nameController,
              validator: _validateName,
              decoration: const InputDecoration(
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
              focusNode: _phoneFoxusNode,
              validator: _validatePhone,
              onFieldSubmitted: (str){
                _changeFocus(context, _phoneFoxusNode, _passFoxusNode);
              },
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              // inputFormatters: [
              //   FilteringTextInputFormatter(RegExp(r'^[()\d -]{1a,15}$'),
              //       allow: true),
              // ],
              maxLength: 16,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                helperText: 'Phone we can call you',
                suffixIcon: Icon(Icons.delete_outline),
                suffixIconColor: Colors.red,
                labelText: 'Phone Number',
                hintText: '(xxx)xxxx-xxx',
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
              controller: _emailController,
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.mail),
                hintText: 'Surname Name',
                helperText: 'Only Surname and Name',
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              items: _countries
                  .map((country) => DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      ))
                  .toList(),
              onChanged: (data) {
                print(data);
                setState(() {
                  _selectedCountry = data as String;
                });
                value:
                _selectedCountry;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _storyController,
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
              focusNode: _passFoxusNode,
              obscureText: _hidePass,
              controller: _passController,
              validator: _validatePass,
              maxLength: 12,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.security),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon: _hidePass
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                hintText: 'Enter password',
                helperText: 'Symbols, numbers, special characters',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: _hidePass,
              validator: _validatePass,
              controller: _confirmPassController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: const Icon(Icons.border_color),
                hintText: 'Enter passwords',
                helperText: 'Same as in field password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon: _hidePass
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: _submitForm,
              child: const Text('Submit Form'),
            ),
          ],
        ),
      ),
    );
  }

  void _changeFocus(BuildContext context, FocusNode currentFocusNode,
      FocusNode newFocusNode) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(newFocusNode);
  }

  void _submitForm() {
    if ((_formKey.currentState?.validate()) ?? false) {
      _formKey.currentState?.save();
      print(_nameController.text);
      print(_phoneController.text);
      print(_emailController.text);
      print(_storyController.text);
    }
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r'^[a-zA-Z]+$');
    if ((value?.isEmpty) ?? false) {
      return 'Plz input non empty value';
    } else if (!nameExp.hasMatch(value ?? '')) {
      return 'Plz input non empty value';
    } else {
      return null;
    }
  }

  String? _validatePhone(String? value) {
    final phoneExp = RegExp(r'^\(\d{3}\)\d{3}-\d{4}$');
    if ((value?.isEmpty) ?? false) {
      return 'Plz input non empty phone';
    } else if (!phoneExp.hasMatch(value ?? '')) {
      return 'Plz input phone in format (xxx)xxx-xxxx';
    } else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    if ((value?.isEmpty) ?? false) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? _validatePass(String? value) {
    if (((value?.length ?? 0) <= 8)) {
      return 'Password minimum 8 symbols';
    } else if (_passController.text != _confirmPassController.text) {
      return 'Password and confirm password does not match';
    } else {
      return null;
    }
  }
}
