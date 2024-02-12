#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  const port = '8080';
  final host = 'http://0.0.0.0:$port';

  setUp(() async {
    final p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    await p.stdout.first;
  });

  tearDown(() async {
    final response = await get(Uri.parse('$host/shutdown'));
    expect(response.statusCode, 200);
  });

  test('POST request', () async {
    final weekdays = {'monday': true, 'tuesday': false};
    final time = {'time': '12:00 PM'};
    final body = jsonEncode([weekdays, time]);

    final response = await post(Uri.parse('$host/'), body: body);
    expect(response.statusCode, 200);
    expect(response.body, body);
  });

  test('Invalid JSON', () async {
    const body = 'invalid json';

    final response = await post(Uri.parse('$host/'), body: body);
    expect(response.statusCode, 400);
  });

  test('GET request', () async {
    final response = await http.get(Uri.parse('$host/'));
    expect(response.statusCode, 405);
  });

  test('PUT request', () async {
    final response = await http.put(Uri.parse('$host/'));
    expect(response.statusCode, 405);
  });

  test('DELETE request', () async {
    final response = await http.delete(Uri.parse('$host/'));
    expect(response.statusCode, 405);
  });

  test('HEAD request', () async {
    final response = await http.head(Uri.parse('$host/'));
    expect(response.statusCode, 405);
  });

  test('OPTIONS request', () async {
    final response = await http.options(Uri.parse('$host/'));
    expect(response.statusCode, 405);
  });

  test('PATCH request', () async {
    final response = await patch(Uri.parse('$host/'));
    expect(response.statusCode, 405);
  });
}
