import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Login'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(flex: 4),
              _Username(),
              SizedBox(height: 16.0),
              _Password(),
              SizedBox(height: 16.0),
              _LogButton(),
              Spacer(flex: 2),
              _RegisterRedirect(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterRedirect extends StatelessWidget {
  const _RegisterRedirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('register');
      },
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: 'Don\'t have an account? '),
            TextSpan(
              text: 'Register',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogButton extends StatelessWidget {
  const _LogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: const Size(96, 48.0),
      ),
      child: Text(
        'Login',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black87,
            ),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      labelText: 'Password',
      obscureText: true,
    );
  }
}

class _Username extends StatelessWidget {
  const _Username({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      labelText: 'Username',
      textInputType: TextInputType.name,
    );
  }
}
