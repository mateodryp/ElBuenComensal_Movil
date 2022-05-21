import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
    
    @override
    Widget build(BuildContext context) {
     return Container(
       key: formkey,
     );
   }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formkey.currentState?.validate() ?? false;
  }
}
