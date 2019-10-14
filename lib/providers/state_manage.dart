import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../models/profile.dart';


class StateManage with ChangeNotifier{

  Profile _profile = profiles[0];

  Profile get profile {
      return _profile;
  }

  void fetchProfile(int index){
      _profile = profiles[index];
      notifyListeners();
  }


}