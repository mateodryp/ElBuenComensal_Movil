 import 'package:el_buen_comensal/widgets/app_bar_simple.dart';
import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:el_buen_comensal/widgets/input_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/change_password_provider.dart';
import '../services/user_services.dart';
import '../theme/app_theme.dart';
import '../widgets/alert_dialog_custom.dart';

class ChangePassword extends StatefulWidget {
   
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String contrasena = "";
  String confContrasena = "";
  GlobalKey<FormState>? register;

   @override
  void dispose() {
    register?.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final changePasswordForm = Provider.of<ChangePasswordProvider>(context);
    register = changePasswordForm.formkey;

    return  Scaffold(
      appBar: AppBarSimple(title: "Cambiar Contraseña"),
      body: Column(
        children: [
          Form(
            key:  register,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  InputRegister(
                    hint_text: 'Contraseña', 
                    type: TextInputType.text, 
                    isPasswd: true, 
                    validate: validatePasswordSize, 
                    changed: (value) {
                      setState(() {
                        contrasena = value;
                    });
                  }),
                  SizedBox(height: 40),
                  InputRegister(
                    hint_text: 'Confirmar Contraseña', 
                    type: TextInputType.text, 
                    isPasswd: true, 
                    validate: validateConfirmPassword, 
                    changed: (value) {
                      setState(() {
                        confContrasena= value;
                    });
                  }),
                  SizedBox(height: 40),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: AppTheme.primary_yellow,
                      disabledColor: Color.fromARGB(255, 245, 212, 130),
                      onPressed: changePasswordForm.isLoading
                          ? null
                          : () async {
                             FocusScope.of(context).unfocus();
                             final userServices = Provider.of<UserServices>(context,listen: false);
                             if(!changePasswordForm.isValidForm()) {
                              print("No valido");
                              return;
                             };
                             changePasswordForm.isLoading = true;
                             bool respuesta = await userServices.changePassword(10, contrasena);
                             print("Respuesta: " + respuesta.toString());
                             if(respuesta){
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialogCustom(
                                      title: "¡Contraseña cambiada!",
                                      rute: 'home',
                                      message:
                                          "Se ha cambiado su contraseña de manera exitosa",);
                                }
                              );
                             }else{
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialogCustom(
                                      title: "¡Error en el servidor!",
                                      message:
                                          "No se pudo cambiar la contraseña",);
                                }
                              );

                             }
                             changePasswordForm.isLoading = false;
                          },
                      elevation: 0,
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text('Enviar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)))),
                    ),

                ],
              ),
            )
          )
          
          
        ],
        )
    );
  }
   validateConfirmPassword(String value) {
    if (value.isNotEmpty) {
      if (value == contrasena) {
        return null;
      } else {
        return "Contraseñas no coinciden";
      }
    } else {
      return "Por favor llene el campo";
    }
  }
}

validatePasswordSize(String? value) {
  if (value!.isNotEmpty) {
    if (value.length > 8) {
      return null;
    } else {
      return "Contraseña minimo de 8 caracteres";
    }
  } else {
    return "Por favor llene el campo";
  }
}