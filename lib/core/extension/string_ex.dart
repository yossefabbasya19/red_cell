import 'package:red_cell/core/assets_maneger/assets_maneger.dart';

extension StringEx on String{
  String get selectImage{
    if(this == "Blood"){
      return AssetsManeger.requestBlood;
    }
    else if(this == "Plasma"){
      return AssetsManeger.requestPlasma;
    }
    else{
      return AssetsManeger.requestPlatelet;
    }
  }
}
extension StringExOnBool on bool{
  String get selectState{
    if(this == false){
      return "in progress";
    }
    else{
      return "complete";
    }
  }
}