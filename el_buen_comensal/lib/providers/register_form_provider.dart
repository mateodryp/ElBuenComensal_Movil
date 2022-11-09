import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
    
    @override
    Widget build(BuildContext context) {
     return Container(
       key: _formkey,
     );
   }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  get key{
    return _formkey;
  }


  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){
    return _formkey.currentState?.validate() ?? false;
  }
}
