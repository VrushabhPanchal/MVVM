import 'package:flutter/material.dart';
import 'package:mvvm/res/components/Rounded_Button.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_models/Auth_View_Model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    print('.........build');
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, _emailFocusNode, _passwordFocusNode);
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: _obscurePassword.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          child: _obscurePassword.value
                              ? Icon(Icons.visibility_off_sharp)
                              : Icon(Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * .05,
              ),
              RoundedButton(
                title: 'SignUp',
                loading: authViewMode.signUpLoading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please Enter Email', context, Colors.red);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please Enter Password', context, Colors.red);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please Enter 6 character password', context,
                        Colors.red);
                  } else {
                    Map data = {
                      'email': _emailController.text,
                      'password': _passwordController.text
                    };

                    authViewMode.signUpApi(data, context);

                    print('api hit');
                  }
                },
              ),
              SizedBox(
                height: height * .01,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                },
                child: Text("Already have an account ? sign up"),
              )
            ],
          )),
    );
  }
}