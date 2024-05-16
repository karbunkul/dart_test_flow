import 'package:flutter/material.dart';

class AuthManager extends StatefulWidget {
  final Widget child;
  const AuthManager({super.key, required this.child});

  @override
  State<AuthManager> createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  bool _authorized = false;

  @override
  Widget build(BuildContext context) {
    return AuthScope(
      authorized: _authorized,
      login: _onLogin,
      logout: _onLogout,
      child: widget.child,
    );
  }

  void _onLogin() {
    if (_authorized) {
      return;
    }

    setState(() => _authorized = true);
  }

  void _onLogout() {
    if (!_authorized) {
      return;
    }

    setState(() => _authorized = false);
  }
}

class AuthScope extends InheritedWidget {
  final VoidCallback login;
  final VoidCallback logout;

  const AuthScope({
    super.key,
    required super.child,
    required bool authorized,
    required this.login,
    required this.logout,
  }) : _authorized = authorized;

  final bool _authorized;

  static AuthScope of(BuildContext context) {
    final AuthScope? result =
        context.dependOnInheritedWidgetOfExactType<AuthScope>();
    assert(result != null, 'No AuthScope found in context');
    return result!;
  }

  bool get isAuthorized => _authorized;

  @override
  bool updateShouldNotify(AuthScope oldWidget) {
    return _authorized != oldWidget._authorized;
  }
}
