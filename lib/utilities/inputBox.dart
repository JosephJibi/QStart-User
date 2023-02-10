import 'package:flutter/material.dart';

class inputBoxes
{
  var maininputDecoration = InputDecoration(
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  label: const Text('Email'),
                  contentPadding: const EdgeInsets.all(20.0),
                );
}