import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hof_book_nook/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hof Book Nook')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign-in Page',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: BlocProvider(
                create: (context) {
                  return LoginBloc(
                    authenticationRepository:
                        RepositoryProvider.of<AuthenticationRepository>(
                            context),
                  );
                },
                child: const LoginForm(),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextButton(
                child: const Text('Forgot Password',
                    selectionColor: Colors.grey,
                    style: TextStyle(fontSize: 12)),
                onPressed: () {
                  //route to forgot_password page
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Don't have an account?"),
              TextButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 14),
                ),
                onPressed: () {
                  // route to the signup page
                },
              )
            ],
          )
        ]),
      ),
    );
  }
}
