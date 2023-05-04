import 'package:ploff_kebab/core/local_source/cached_product.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/product_detail_cubit.dart';
import 'package:ploff_kebab/service/product_hive_service.dart';
import 'injector_container.dart' as di;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.registerAdapter(ProductAdapter());
  final productHiveService = ProductHiveService();
  await productHiveService.openbox();

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
