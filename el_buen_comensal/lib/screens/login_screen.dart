import 'package:el_buen_comensal/share%20preferences/Preferences.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:el_buen_comensal/ui/input_login_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';
import '../providers/login_form_provider.dart';
import '../providers/user_info_provider.dart';
import '../services/user_services.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppTheme.dark_gray,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(height: 70),
                    LogoWidget(),
                    SizedBox(height: 30),
                    Text('Bienvenido',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(height: 40),
                    FormWidget(),
                    SizedBox(height: 20),
                    CommentTextButton()
                  ]),
            ),
          )),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String correo = "";
  String password = "";
  GlobalKey<FormState>? login;
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    login = loginForm.formkey;

    return Form(
        key: login,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            InputLogin(
              hint_text: 'Correo Electrónico',
              icon: Icons.alternate_email_outlined,
              type: TextInputType.emailAddress,
              isPasswd: false,
              changed: (value) {
                setState(() {
                  correo = value;
                });
              },
              validate: validateEmpty,
            ),
            const SizedBox(height: 25),
            InputLogin(
              hint_text: 'Contraseña',
              icon: Icons.lock_outlined,
              type: TextInputType.text,
              isPasswd: true,
              changed: (value) {
                setState(() {
                  password = value;
                });
              },
              validate: validateEmpty,
            ),
            const SizedBox(height: 10),
            const TextButton(
              onPressed: null,
              child: Text('Olvide mi contraseña',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200)),
            ),
            //Login Button
            const SizedBox(height: 10),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: AppTheme.primary_yellow,
              disabledColor: Color.fromARGB(255, 245, 212, 130),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final userServices =
                          Provider.of<UserServices>(context, listen: false);
                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      User respuesta =
                          await userServices.loginUser(correo, password);
                      print("llego:" + respuesta.email);
                      if (respuesta.code == 1) {
                        print(Preferences.GetIdUser);
                        print(Preferences.GetToken);
                        context.read<UserInfoProvider>().setUser(respuesta);
                        Navigator.pushNamed(context, "home");
                      } else {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialogCustom(
                                title: "¡Usuario o contraseña incorrectos!",
                                message: "Por favor verifique los datos",
                              );
                            });
                      }
                      loginForm.isLoading = false;
                    },
              elevation: 0,
              child: Container(
                  width: double.infinity,
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Ingresar',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)))),
            ),
            const SizedBox(height: 15),

            //Register Button
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      color: AppTheme.primary_yellow, width: 2)),
              onPressed: () => Navigator.pushNamed(context, 'register'),
              elevation: 0,
              disabledColor: Color.fromARGB(255, 245, 212, 130),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Registrarme',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)))),
            )
          ],
        ));
  }

  validateEmpty(String? value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return "Por favor llene el campo";
    }
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
      child: Container(
        width: double.infinity,
        child: const Image(
          image: AssetImage('assets/logo_white.png'),
        ),
      ),
    );
  }
}

class CommentTextButton extends StatelessWidget {
  const CommentTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: null,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text("Conoce mas acerca de nuestro",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text("proyecto",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300)),
            SizedBox(width: 6),
            Text("aqui",
                style: TextStyle(
                    color: AppTheme.primary_yellow,
                    fontSize: 18,
                    fontWeight: FontWeight.w300))
          ])
        ]));
  }
}
