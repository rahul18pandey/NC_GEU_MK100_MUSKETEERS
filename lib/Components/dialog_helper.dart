
import 'package:flutter/material.dart';

import 'exit_confirmation_dialog.dart';

class DialogHelper {

  static exit(context) => showDialog(context: context, builder: (context) => ExitConfirmationDialog());
}