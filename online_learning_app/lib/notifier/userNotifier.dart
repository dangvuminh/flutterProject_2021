
import 'package:flutter/cupertino.dart';
import 'package:online_learning_app/models/user.dart';
import 'package:online_learning_app/models/userInfo.dart';

class UserNotifier extends ChangeNotifier{
    User user;
    UserProfile userProfile;
    int state;
    void getRegisterState(int stateIn,User data){
      state = stateIn;
      user = data;
      notifyListeners();
    }

    void getLoginState(int stateIn,UserProfile data){
      state = stateIn;
      userProfile = data;
      notifyListeners();
    }
}