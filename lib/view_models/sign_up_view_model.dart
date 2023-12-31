import 'package:aircraft_inventory_management/data/remote/responses/api_response.dart';
import 'package:aircraft_inventory_management/repositories/auth_repository.dart';
import 'package:aircraft_inventory_management/utils/routes/route_names.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../dependency_injection/di.dart';
import '../utils/dialogs/error_dialog.dart';
import '../utils/email_validation.dart';

class SignupViewModel extends ChangeNotifier{

  AuthRepository authRepository = sl.get<AuthRepository>();
  bool isobsecured=true;
  bool isloading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  changeIsObsecured(){
    isobsecured = !isobsecured;
    notifyListeners();
  }

  navigateToLogin(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
  }

  send_otp(BuildContext context)async{
    if(!EmailValidator.validate(emailController.text.trim())){
      showSimpleErrorDialog(context, 'Invalid Email Format');
      return;
    }
    if(passwordController.text.trim().isEmpty){
      showSimpleErrorDialog(context, 'Password field must not be empty');
      return;
    }
    if(passwordController.text.trim()!=confirmPasswordController.text.trim()){
      showSimpleErrorDialog(context, 'Confirm password does not match');
      return;
    }
    EasyLoading.show(status: "Please wait for a moment");
    isloading=true;
    notifyListeners();

    var result = await authRepository.send_otp(emailController.text.trim(), 'signup', 'FALSE');

    if(result is Success){
      EasyLoading.dismiss();

      Navigator.of(context).pushNamed(RouteNames.otpview,arguments: <String, dynamic>{
        'reason':'sign_up',
        'email':emailController.text.trim(),
        'password':passwordController.text.trim()
      });
      isloading=false;
      notifyListeners();

    }else if(result is Failure){
      EasyLoading.dismiss();
      var error = result.error as Map;
      isloading=false;
      notifyListeners();
      showSimpleErrorDialog(context, error['error']);
    }


  }

  @override
  void dispose() {
    // TODO: implement dispose
    //onViewClosed();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

}