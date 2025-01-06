
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../data/datasource/local/ProductLocalDataSource.dart';
import '../data/datasource/remote/ProductRemoteDataSource.dart';
import '../data/repositories/ProductRepositoryImpl.dart';
import '../domain/repositories/ProductRepository.dart';
import '../domain/usecases/GetProducts.dart';
import '../presentation/bloc/product_bloc.dart';
final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => ProductBloc(getProducts: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetProducts(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
  ));

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(client: sl(), timeoutDuration: const Duration(seconds: 60))); // Set custom timeout here
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());

  // External
  sl.registerLazySingleton(() => http.Client());
}