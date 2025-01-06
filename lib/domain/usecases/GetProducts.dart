
import '../entities/product.dart';
import '../repositories/ProductRepository.dart';


class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() async {
    return repository.getProducts();
  }
}