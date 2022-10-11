import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hof_book_nook/authentication/authentication.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
          child: ListView(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10),
            child: const ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                ElevatedButton(
                  onPressed: null, // route to listings page
                  child: Text('My Listings'),
                ),
                ElevatedButton(
                  onPressed: null, // route to home page ... this page ...
                  child: Text('Home'),
                ),
                ElevatedButton(
                  onPressed: null, // route to account page
                  child: Text('My Account'),
                ),
              ],
            )),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.id,
                );
                return Container(
                    height: 400.0,
                    alignment: Alignment.center,
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: const Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'Search by ISBN, Title, Author',
                                suffixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: const Text('Recently Viewed Textbooks:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: const Text('',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16)),
                              ),
                              SizedBox(
                                width: 350,
                                height: 42.0,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                      color:
                                          Color.fromARGB(240, 220, 220, 220)),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      "Mock Textbook Entry Box < to be implemented >",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: const Text('Proof of User Login:',
                              textAlign: TextAlign.center)),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text('UserID: $userId',
                            textAlign: TextAlign.center),
                      ),
                    ]));
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ])),
    );
  }
}
