import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/data/local/cacheHelper.dart';
import 'package:hoga_load/core/keys/keys.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/auth/domain/auth_cubit.dart';
import 'package:hoga_load/features/home/controller.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_cubit.dart';
import 'package:hoga_load/features/loads/cubit/getLoad_cubit.dart';
import 'package:hoga_load/features/loads/view.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';
import 'package:hoga_load/features/splash/splash_view.dart';
import 'package:provider/provider.dart';

import 'features/add_vehicle/cubit/getDataForm_cubit.dart';
import 'features/add_vehicle/cubit/getVehicle_cubit.dart';
import 'features/blogs/bloc/blog_cubit.dart';
import 'features/change_password/cubit/changePass_cubit.dart';
import 'features/dashboard/cubit/updateProfile_cubit.dart';
import 'features/packages/cubit/package_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(
            create: (_) => VehiclesCubit()
              ..getAttributesCubit()
              ..getEquipmentsCubit()
              ..getVehicleSizesCubit()
              ..getVehicleTypesCubit()
              ..getVehicleCubit()
        ),
        BlocProvider(
            create: (_) => DataFormCubit()
              ..getCity()
              ..getCountry()
              ..getState()
              ..getProduct()),
        BlocProvider(
            create: (_) => LoadsCubit()..getLoad()),
        BlocProvider(
            create: (_) => ProductsCubit()..getProduct()),
        BlocProvider(
            create: (_) => JopCubit()..getJop()),
        BlocProvider(create: (_) => PackageCubit()..getPackageCubit()),
        BlocProvider(create: (_)=>ChangePassCubit()),
        BlocProvider(create: (_)=>UpdateProfileCubit()),
        BlocProvider(
            create: (_) => BlogsCubit()
              ..getBlogsCubit(CacheHelper.getString(SharedKeys.token))..blogList),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, _) => MaterialApp(
          theme: ThemeData(fontFamily: 'Montserrat'),
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: onGenerateRoute,
          home: const AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark),
              child: SplashScreen()),
        ),
      ),
    );
  }
}
