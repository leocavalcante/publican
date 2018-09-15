import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:publican/publican.dart';

Future<void> main() async {
  final File pubspec = new File('pubspec.yaml');

  final CommandRunner runner =
      new CommandRunner('publican_example', 'Publican example')
        ..addCommand(new InitCommand(pubspec))
        ..addCommand(new AddCommand(pubspec));

  await runner.run(['init']);
}
