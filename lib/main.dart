import 'package:ploff_kebab/export_files.dart';
import 'injector_container.dart' as di;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();

  runApp(const PloffApp());
  FlutterNativeSplash.remove();
}
