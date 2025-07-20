import 'package:perfumio/providers/login_provider.dart';
import 'package:perfumio/providers/scroll_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => LoginProvider()),
  ChangeNotifierProvider(create: (_) => ScrollProvider()),
];
