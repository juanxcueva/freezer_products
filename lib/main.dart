import 'package:flutter/material.dart';
import 'package:freezer_products/app/ui/my_app.dart';
import 'package:freezer_products/dependency_injector.dart';

// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  injectDependencies();
  runApp(MyApp());
 
}