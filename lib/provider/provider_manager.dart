

import 'package:flutter_project/provider/theme_provider.dart';
import 'package:flutter_project/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> topProviders = [
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => ThemeProvider()),

];
