import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension StringEx on String{
  String  selectImage(BuildContext context){
    if(this == "دم"||this=='Blood'){
      return AssetsManeger.requestBlood;
    }
    else if(this == "بلازما"||this=='Plasma'){
      return AssetsManeger.requestPlasma;
    }
    else{
      return AssetsManeger.requestPlatelet;
    }
  }
}
extension StringExOnBool on bool{
  String  selectState(BuildContext context){
    if(this == false){
      return AppLocalizations.of(context)!.in_progress;
    }
    else{
      return AppLocalizations.of(context)!.complete;
    }
  }
}