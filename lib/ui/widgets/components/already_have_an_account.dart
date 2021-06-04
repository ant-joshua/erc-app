import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccount({Key? key, this.login = true, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(login
              ? "Don`t have an Account ? "
              : "Already have an account ? "),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, login ? "/register" : "/login");
            },
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
