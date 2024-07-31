import 'package:app_state/mvvm/view.dart';
import 'package:app_state/mvvm/view_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CounterView(viewModel: ViewModel())));
