import 'package:flutter/cupertino.dart';
import 'package:login_app/models/user.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  List<User> users = [];

  UserProvider({required this.child}) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return true;
  }
}
