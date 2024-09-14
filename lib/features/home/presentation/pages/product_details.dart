import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/datasources/remote_data_source/home_remote_data_source_impl.dart';
import '../../data/models/product_detail.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../bloc/home_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  static const id = "product_detail";

  final String link;

   ProductDetailScreen({super.key, required this.link});

  late ProductDetail? productDetail;

  String parseHtmlString(String? htmlString) {
    if (htmlString == null) return '';
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => HomeBloc(
        homeRepository: HomeRepositoryImpl(
            homeRemoteDataSource: HomeRemoteDataSourceImpl(
          dio: DioProvider(),
        )),
      )..add(GetProductDetailEvent(path: link)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 12,
          centerTitle: true,
          title: const Text("Product Details"),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeFailureState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailSuccessState) {
              productDetail = state.productDetail;
             final product = productDetail!.data!.first;
              return product != null
                  ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Images
                      if (product.photos != null && product.photos!.isNotEmpty)
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.photos!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  product.photos![index].path ?? '',
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),

                      // Product Name
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          product.name ?? 'No Product Name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.mainPrice ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (product.hasDiscount ?? false)
                            Text(
                              product.strokedPrice ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),

                      // Stock and Unit
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Stock: ${product.currentStock ?? 0}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Unit: ${product.unit ?? ''}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Rating and Reviews
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(
                            '${product.rating ?? 0} (${product.ratingCount ?? 0} reviews)',
                          ),
                        ],
                      ),

                      // Description
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          parseHtmlString(product.description),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      // Shop Information
                      if (product.shopName != null)
                        ListTile(
                          leading: product.shopLogo != null
                              ? Image.network(
                            product.shopLogo!,
                            width: 50,
                            height: 50,
                          )
                              : Icon(Icons.store),
                          title: Text(product.shopName ?? ''),
                          subtitle: Text('Shop ID: ${product.shopId ?? ''}'),
                        ),
                    ],
                  ),
                ),
              )
                  : Center(child: Text('No product details available.'));
            } else {
              return const Center(child: Text("Failed to load data"));
            }
          },
        ),
      ),
    ));
  }
}

