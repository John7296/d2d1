import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseWidgetStatefulState<T extends StatefulWidget>
    extends State<T> {
  OverlayEntry? loader;

  BaseWidgetStatefulState();

  @override
  void initState() {
    super.initState();
  }

  // void showLoader() {
  //   loader ??= Helper.overlayLoader(context);

  //   Overlay.of(context)!.insert(loader!);
  // }

  // void hideLoader() {
  //   Helper.hideLoader(loader!);
  // }

  void replaceScreen(String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  void gotToScreen(String route) {
    Navigator.pushNamed(context, route);
  }

  void goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }

  // void showFlashMsg(String msg, {Color color = const Color(0xFF272532)}) {
  //   showFlash(
  //     context: context,
  //     duration: const Duration(seconds: 4),
  //     builder: (context, controller) {
  //       return Flash(
  //         controller: controller,
  //         behavior: FlashBehavior.floating,
  //         position: FlashPosition.top,
  //         boxShadows: kElevationToShadow[2],
  //         backgroundColor: color,
  //         reverseAnimationCurve: Curves.easeInCirc,
  //         forwardAnimationCurve: Curves.easeInOutBack,
  //         margin: const EdgeInsets.all(8.0),
  //         borderRadius: BorderRadius.circular(6.0),
  //         horizontalDismissDirection: HorizontalDismissDirection.horizontal,
  //         child: FlashBar(
  //           content: Text(
  //             msg,
  //             style: const TextStyle(fontSize: 15.0, color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  Size getScreenSize() {
    return MediaQuery.of(context).size;
  }

  double getHeightByPercentage(double percentage) {
    return getScreenSize().height * percentage / 100;
  }
    double getWidthByPercentage(double percentage) {
    return getScreenSize().width * percentage / 100;
  }
}
