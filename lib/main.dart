// import 'dart:html';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:tctvideo/models/ModelProvider.dart';
import 'package:tctvideo/models/UserModel.dart';
import 'package:tctvideo/utils/formFiled.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      // final auth = AmplifyAuthCognito();
      // final _amplify = Amplify();

      // // same error bro .wait i call jani
      // await amplify.addPlugin(auth);

      // // call Amplify.configure to use the initialized categories in your app
      final _dataStorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      final AmplifyAPI _apiPlugin = AmplifyAPI();
      final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
      final authPlugin = AmplifyAuthCognito();
      await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, authPlugin]);
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      // print('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TCT Video"),
      ),
      body: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  // Create a boolean for checking the sign in status
  bool isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Container(
            child: const Center(
              child: Text(
                "MEMBER SIGN-IN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          FormFiled(
            hintText: 'enter your email',
            textEditingController: email,
            icon: Icons.email_outlined,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          FormFiled(
            hintText: 'enter your password',
            textEditingController: password,
            icon: Icons.lock_outline,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
            onTap: () async {
              // setState(() {
              //   signInUser(email.text, password.text);
              // });
              //   if (UserModel.EMAIL == email.text &&
              //       UserModel.PASSWORD == password.text) {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (context) => Page1()));
              //   } else {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (context) => Page2()));
              //   }

              try {
                List<UserModel> UserModels =
                    await Amplify.DataStore.query(UserModel.classType);
                for (int i = 0; i < UserModels.length; i++) {
                  if (UserModels[i].email == email.text &&
                      UserModels[i].password == password.text) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page1()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()));
                  }
                }
              } catch (e) {
                print("Could not query DataStore: " + e.toString());
              }
            },
            child: Text('Sign In'),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              const Text(
                'does not remember password ?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Color(0xFF4FA3A5),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      setState(() {
        // isSignedIn = res.isSignedIn;
        isSignedIn = !isSignedIn;
      });
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Page 1'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Page 2'),
    );
  }
}
