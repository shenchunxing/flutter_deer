import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer/util/toast_utils.dart';

/// 双击返回退出
class DoubleTapBackExitApp extends StatefulWidget {

  const DoubleTapBackExitApp({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 2500),
  });

  final Widget child;
  /// 两次点击返回按钮的时间间隔
  final Duration duration;

  @override
  _DoubleTapBackExitAppState createState() => _DoubleTapBackExitAppState();
}

class _DoubleTapBackExitAppState extends State<DoubleTapBackExitApp> {

  DateTime? _lastTime;

  @override
  Widget build(BuildContext context) {
    /*WillPopScope：监听退出*/
    return WillPopScope(
      onWillPop: _isExit,
      child: widget.child,
    );
  }

  Future<bool> _isExit() async {
    /*连续两次的点击时间间隔*/
    if (_lastTime == null || DateTime.now().difference(_lastTime!) > widget.duration) {
      _lastTime = DateTime.now();
      Toast.show('再次点击退出应用');
      return Future.value(false);
    }
    Toast.cancelToast();
    /// 不推荐使用 `dart:io` 的 exit(0)
    await SystemNavigator.pop();
    return Future.value(true);
  }
}
