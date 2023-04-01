import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthManager extends ChangeNotifier {
  final Ref ref;

  AuthManager(this.ref);
}

final authManagerProvider = ChangeNotifierProvider((ref) => AuthManager(ref));
