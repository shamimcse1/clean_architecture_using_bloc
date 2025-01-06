
import '../../domain/entities/product.dart';
import '../../domain/repositories/ProductRepository.dart';
import '../datasource/local/ProductLocalDataSource.dart';
import '../datasource/remote/ProductRemoteDataSource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Product>> getProducts() async {
    final remoteProducts = await remoteDataSource.getProducts();
    localDataSource.cacheProducts(remoteProducts);
    return remoteProducts;
  }
}