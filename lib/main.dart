import 'package:ploff_kebab/core/local_source/cached_product.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/user_locations.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/product_detail/product_detail_cubit.dart';
import 'package:ploff_kebab/service/hive_service.dart';
import 'package:ploff_kebab/service/shared_preferences_serive.dart';
import 'injector_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesService.instance.sharedPreferences =
      await SharedPreferences.getInstance();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter<UserLocations>(UserLocationsAdapter());
  final productHiveService = ProductHiveService();
  await productHiveService.openbox();
  await UserLocationsHiveSerive.instance.createBox();

  await di.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(BlocProvider(
    create: (context) => ProductDetailCubit(
      cachedProducts: CachedProducts(
        hiveService: productHiveService,
      ),
    )..getCachedProducts(),
    child: const PloffApp(),
  ));
  FlutterNativeSplash.remove();
}
