import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:publican/publican.dart';

void main(List<String> args) {
  final File pubspec = new File('pubspec.yaml');

  final CommandRunner runner = new CommandRunner(
      'publican', 'The package that will help you out with Dart\'s Pub')
    ..addCommand(new InitCommand(pubspec))
    ..addCommand(new AddCommand(pubspec));

  runner.run(args).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64); // Exit code 64 indicates a usage error.
  });
}
