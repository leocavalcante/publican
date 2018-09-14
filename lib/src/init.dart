import 'dart:io';
import 'dart:async';
import 'package:args/command_runner.dart';

class InitCommand extends Command {
  final File pubspec;

  final String name = 'init';
  final String description = 'Initialize a pubspec file';

  InitCommand(this.pubspec) {
    argParser.addOption('name', abbr: 'n', defaultsTo: 'my_app');
    argParser.addOption('version', abbr: 'v', defaultsTo: '0.1.0');
    argParser.addOption('description',
        abbr: 'd', defaultsTo: 'My awesome Dart app');
  }

  Future run() async {
    if (await pubspec.exists()) {
      print('Already got a pubspec file.');
      return 'Already got a pubspec file.';
    }

    await pubspec.writeAsString('''
name: ${argResults['name']}
version: ${argResults['version']}
description: ${argResults['description']}
''');

    print('pubspec file created!');
  }
}
