
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/GetProducts.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../widgets/product_list.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(getProducts: context.read<GetProducts>())..add(FetchProducts()),
        child: const ProductList(),
      ),
    );
  }
}