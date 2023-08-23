import 'dart:developer';

import 'package:bloc/bloc.dart';

class Blocobserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }
}
