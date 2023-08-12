import 'dart:io';

/// Reads a file from the fixtures directory.
/// Pass the file name without the path.
String readFixture(String name) =>
    File('test/fixtures/$name').readAsStringSync();
