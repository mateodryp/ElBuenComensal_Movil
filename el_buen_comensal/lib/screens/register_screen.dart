import 'package:el_buen_comensal/screens/screens.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../ui/input_login_decoration.dart';
import '../ui/input_register_decoration.dart';

class RegisterScreen extends StatefulWidget {


  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  String nombres = "";
  String apellidos = "";
  String correo = "";
  String telefono = "";
  String contrasena = "";
  String confContrasena = "";
  String edad = "";
  bool aceptTerms = false;

  
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
        backgroundColor: AppTheme.dark_gray,
        body: SingleChildScrollView(
            child: Column(children: [
          HeaderRegister(),
          SizedBox(height: 30),
          Center(
              child: Text("Formulario de registro",
                  style: TextStyle(color: Colors.white, fontSize: 28))),
          Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    InputRegister(hint_text: 'Nombres',type: TextInputType.text,isPasswd: false,validate: validateEmpty, changed: (value){
                      setState(() {
                        nombres = value;
                      });
                    }),
                    SizedBox(height: 15),
                    InputRegister(hint_text: 'Apellidos',type: TextInputType.text,isPasswd: false,validate: validateEmpty,changed: (value){
                      setState(() {
                        apellidos = value;
                      });
                    }),
                    SizedBox(height: 15),
                    InputRegister(hint_text: 'Correo Electrónico',type: TextInputType.emailAddress,isPasswd: false,validate: validateEmpty, changed: (value){
                      setState(() {
                        correo = value;
                      });
                    }),
                    SizedBox(height: 15),
                    InputRegister(hint_text: 'Telefono',type: TextInputType.phone,isPasswd: false,validate: validateEmpty, changed: (value){
                      setState(() {
                        telefono = value;
                      });
                    }),
                    SizedBox(height: 15),
                    InputRegister(hint_text: 'Edad',type: TextInputType.number,isPasswd: true,validate: validateEmpty,changed: (value){
                      setState(() {
                        edad = value;
                      });
                    }),
                    SizedBox(height: 15),
                    InputRegister(hint_text: 'Contraseña',type: TextInputType.text,isPasswd: true,validate: validatePasswordSize, changed: (value){
                      setState(() {
                        contrasena = value;
                      });
                    }),
                    SizedBox(height: 15),
                    InputRegister(hint_text: 'Confirmar Contraseña',type: TextInputType.text,isPasswd: true,validate: validateConfirmPassword,changed: (value){
                      setState(() {
                        confContrasena = value;
                      });
                    }),
                    
                    SizedBox(height: 15),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppTheme.primary_yellow,
                      title: Text("Aceptar terminos y condiciones", style: TextStyle(fontSize: 14, color: Colors.white)),
                      value: aceptTerms, 
                      onChanged: (value){
                        setState(() {
                          aceptTerms = value!;
                        });
                      }),
                    const SizedBox(height: 15),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: AppTheme.primary_yellow,
                      disabledColor: AppTheme.primary_yellow,
                      onPressed: null,
                      elevation: 0,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                        child: const Align(alignment: Alignment.center,child: Text('Registrarme', style: TextStyle(color: Colors.white, fontSize: 20)))
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ))
        ]))
        );
        
  }
  
  void changedValue(String? name, String value){
    setState(() {
       name : value;
    });
  }

  validateConfirmPassword(String value){
    if (value.isNotEmpty) {
    if(value==contrasena){
      return null;
    }else{
      return "Contraseñas no coinciden";
    }
  } else {
    return "Por favor llene el campo";
  }
  }

  
}

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          height: 200,
          child: const Image(
            image: AssetImage('assets/image_register.jpg'),
            fit: BoxFit.cover,
          )),
      Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.only(top: 150),
          child: const Image(
            image: AssetImage('assets/logo_white.png'),
          )),
    ]);
  }
}

validateEmpty(String? value){
  if (value!.isNotEmpty) {
    return null;
  } else {
    return "Por favor llene el campo";
  }
}

validatePasswordSize(String? value){
  if (value!.isNotEmpty) {
    if(value.length > 8){
      return null;
    }else{
      return "Contraseña minimo de 8 caracteres";
    }
  } else {
    return "Por favor llene el campo";
  }
}



