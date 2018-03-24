library publican;

import 'dart:io';
import 'dart:async';
import 'package:args/command_runner.dart';

class InitCommand extends Command {
  static const String fileName = 'pubspec.yaml';

  final String name = 'init';
  final String description = 'Initialize a ${InitCommand.fileName} file';

  InitCommand() {
    argParser.addOption('name', abbr: 'n', defaultsTo: 'my_app');
    argParser.addOption('version', abbr: 'v', defaultsTo: '0.1.0');
    argParser.addOption('description',
        abbr: 'd', defaultsTo: 'My awesome Dart app');
  }

  Future run() async {
    final File pubspec = new File(InitCommand.fileName);

    if (await pubspec.exists()) {
      return print('Already got a ${InitCommand.fileName} file.');
    }

    await pubspec.writeAsString('''
name: ${argResults['name']}
version: ${argResults['version']}
description: ${argResults['description']}
''');

    print('${InitCommand.fileName} created!');
  }
}
