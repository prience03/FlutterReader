


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProviderWidget2<T extends ChangeNotifier> extends StatefulWidget{
  final T model;
  final Widget? child;
  ProviderWidget2({Key? key,
    required this.model,
    this.child,
  }):super();


  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

}