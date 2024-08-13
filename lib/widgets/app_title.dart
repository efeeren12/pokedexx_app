import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexx_app/constants/constants.dart';
import 'package:pokedexx_app/constants/ui_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  String pokeballImageUrl = 'images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(alignment: Alignment.centerLeft, child: Text(Constants.title, style: Constants.getTitleTextStyle()),),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              pokeballImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait ? 0.4.sw : 0.4.sh,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
