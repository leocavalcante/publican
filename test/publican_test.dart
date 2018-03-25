library publican_test;

import 'dart:io';
import 'package:test/test.dart';
import 'package:publican/publican.dart';
import 'package:args/command_runner.dart';
import 'package:yaml/yaml.dart';

void main() {
  final File pubspec = new File('pubspec.test.yaml');

  final CommandRunner runner =
      new CommandRunner('publican_test', 'Testing publican')
        ..addCommand(new InitCommand(pubspec))
        ..addCommand(new AddCommand(pubspec));

  test('init bootstraps a pubspec.yaml file with defaults', () async {
    await runner.run(['init']);
    expect(await pubspec.exists(), true);

    final doc = await loadYaml(await pubspec.readAsString());
    expect(doc['name'], 'my_app');
    expect(doc['version'], '0.1.0');
    expect(doc['description'], 'My awesome Dart app');
  });

  test('init bootstraps a pubspec.yaml file with options', () async {
    await runner.run(['init', '-n', 'test', '-v', '1.0.0', '-d', 'Testing']);
    expect(await pubspec.exists(), true);

    final doc = await loadYaml(await pubspec.readAsString());
    expect(doc['name'], 'test');
    expect(doc['version'], '1.0.0');
    expect(doc['description'], 'Testing');
  });

  tearDown(() async {
    if (await pubspec.exists()) {
      pubspec.delete();
    }
  });
}
