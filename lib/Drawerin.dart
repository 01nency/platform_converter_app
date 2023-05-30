// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Test {
  Test({required this.icon, required this.title});
  final Icon icon;
  final String title;
}

List<Test> test = <Test>[
  Test(icon: const Icon(Icons.supervisor_account_outlined), title: "New Group"),
  Test(icon: const Icon(Icons.account_circle_outlined), title: "New Contact"),
  Test(icon: const Icon(Icons.call), title: "Calls"),
  Test(icon: const Icon(Icons.bookmark_add_outlined), title: "saved Messages"),
  Test(icon: const Icon(Icons.settings), title: "Settings"),
];
