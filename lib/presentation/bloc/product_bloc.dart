
import 'package:clean_architecture_using_bloc/presentation/bloc/product_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/GetProducts.dart';
import 'bloc_state.dart';



class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}



class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        print('Error in ProductBloc: $e'); // Log the error
        emit(ProductError('Failed to fetch products'));
      }
    });
  }
}