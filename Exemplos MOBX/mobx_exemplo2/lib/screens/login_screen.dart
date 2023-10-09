import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo2/screens/list_screen.dart';
import 'package:mobx_exemplo2/stores/login_store.dart';
import 'package:mobx_exemplo2/widgets/custom_text_field.dart';

LoginStore loginstore = LoginStore();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => loginstore.isLoggedIn, (loggedIn) {
      if (loggedIn) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ListScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //email
                  Observer(
                    builder: (_) => CustomTextField(
                      hint: 'E-mail',
                      prefix: const Icon(Icons.account_circle),
                      textInputType: TextInputType.emailAddress,
                      onChanged: loginstore.setEmail,
                      enable: !loginstore.isLoading,
                      obscure: false,
                    ),
                  ),

                  //espaço
                  const SizedBox(
                    height: 16,
                  ),

                  //senha
                  Observer(
                    builder: (_) => CustomTextField(
                      hint: 'Senha',
                      prefix: const Icon(Icons.lock),
                      textInputType: TextInputType.text,
                      onChanged: loginstore.setPass,
                      enable: !loginstore.isLoading,
                      obscure: loginstore.visiblePass,
                      suffix: IconButton(
                          onPressed: () {
                            loginstore.setVisiblePass();
                          },
                          icon: loginstore.visiblePass
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                  ),

                  //espaço
                  const SizedBox(
                    height: 16,
                  ),

                  //botão
                  Observer(
                    builder: (_) => SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: loginstore.validations
                            ? () {
                                loginstore.login();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                        ),
                        child: loginstore.isLoading
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ))
                            : const Text(
                                'Login',
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
