import 'package:flutter/material.dart';
import 'view.dart';
import 'view_model.dart';
import 'model.dart';

void main() => runApp(
      MaterialApp(
        home: CounterView(
          viewModel: ViewModel(
            Model(0),
          ),
        ),
      ),
    );
