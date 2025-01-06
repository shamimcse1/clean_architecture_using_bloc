import 'package:clean_architecture_using_bloc/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'di/injection_container.dart' as di;
import 'domain/usecases/GetProducts.dart';
import 'presentation/pages/product_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetProducts>(
          create: (_) => di.sl<GetProducts>(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(getProducts: context.read<GetProducts>()),
        ),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductPage(),
      ),
    );
  }
}