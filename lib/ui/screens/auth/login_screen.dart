import 'package:erc_app/core/dto/login_request_dto.dart';
import 'package:erc_app/core/viewmodels/auth_provider.dart';
import 'package:erc_app/ui/widgets/components/already_have_an_account.dart';
import 'package:erc_app/ui/widgets/components/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  void login() {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      LoginRequestDto loginData = LoginRequestDto(
        username: _usernameController.text,
        password: _passwordController.text,
      );
      AuthProvider.instance(context).login(loginData);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Image(
              //   image: AssetImage("assets/images/erc.jpeg"),
              //   fit: BoxFit.contain,
              // ),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.3,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                child: CustomTextInput(
                  onClick: () {},
                  controller: _usernameController,
                  hintText: "Username",
                  icon: const Icon(Icons.person),
                  onSubmit: (value) {
                    print(value);
                  },
                  // onSubmit: () {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                child: CustomTextInput(
                  onClick: () {},
                  controller: _passwordController,
                  hintText: "Your Password",
                  icon: const Icon(Icons.lock),
                  onSubmit: (value) {
                    print(value);
                  },
                  // onSubmit: () {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                child: SizedBox(
                  width: size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => login(),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const AlreadyHaveAnAccount(
                login: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
