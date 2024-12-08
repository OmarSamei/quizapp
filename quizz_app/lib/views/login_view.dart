import 'package:flutter/material.dart';
import 'package:quizz_app/colors.dart';
import 'package:quizz_app/views/quiz_view.dart';
import 'package:quizz_app/views/register_view.dart';
import 'package:quizz_app/widgets/center_text.dart';
import 'package:quizz_app/widgets/custom_button.dart';
import 'package:quizz_app/widgets/custom_text.dart';
import 'package:quizz_app/widgets/custom_text_field.dart';
import 'package:quizz_app/widgets/end_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        autovalidateMode: autoValidateMode,
        key: key,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 100,
            ),
            const text(
              title: 'Login',
              textAlign: TextAlign.center,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            const text(
              title: 'Login to continue using the app',
              fontSize: 18,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const text(
              title: 'Email',
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
                hint: 'Enter your Email',
                controller: email,
                icon: const Icon(
                  Icons.email_outlined,
                  color: ColorManager.hintColor,
                ),
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 15,
            ),
            const text(
              title: 'Password',
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              controller: password,
              hint: 'Password',
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
                onTap: () {},
                child: EndText(
                  title: 'Forget Password ? ',
                )),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: 'Login',
                onTap: () async {
                  if (key.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const QuizView()));
                  }
                }),
            const SizedBox(
              height: 30,
            ),
            CenterText(
              textHint: 'Don\'t have an account ? ',
              textButton: ' Register',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterView(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void CustomSnackBar(content) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
