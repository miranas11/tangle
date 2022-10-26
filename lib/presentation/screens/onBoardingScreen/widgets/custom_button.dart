import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  const CustomButton({
    Key? key,
    required this.tabController,
    this.text = 'START',
    this.emailController,
    this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).primaryColor,
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, elevation: 0),
          onPressed: () async {
            if (emailController != null && passwordController != null) {
              await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailController!.text,
                      password: passwordController!.text)
                  // ignore: avoid_print
                  .then((value) => print("User added"))
                  // ignore: avoid_print
                  .catchError((error) => print('Failed to add user'));
            }
            tabController.animateTo(tabController.index + 1);
          },
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
