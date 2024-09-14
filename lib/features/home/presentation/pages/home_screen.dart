import 'package:assignment_app/core/network/dio_client.dart';
import 'package:assignment_app/features/home/data/models/category_list_model.dart';
import 'package:assignment_app/features/home/data/models/feature_product_model.dart';
import 'package:assignment_app/features/home/data/models/today_deal_product.dart';
import 'package:assignment_app/features/home/presentation/pages/product_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/values/text_styles.dart';
import '../../data/datasources/remote_data_source/home_remote_data_source_impl.dart';
import '../../data/models/slider_list_model.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const id = "home_screen";

  HomeScreen({super.key});

  late SliderList? sliderList;
  late CategoryList? categoryList;
  late TodayDealProduct? dealList;
  late FeaturedProduct? featuredProductList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        homeRepository: HomeRepositoryImpl(
            homeRemoteDataSource: HomeRemoteDataSourceImpl(
          dio: DioProvider(),
        )),
      )..add(GetHomeDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 12,
          centerTitle: true,
          title: const Text("Pensoftech Assignment"),
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
            } else if (state is HomeSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    // Sliders
                    SizedBox(
                      height: 150,
                      child: CarouselSlider.builder(
                        itemCount: state.sliderList!.data!.length,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 6,
                          viewportFraction: 1,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                state.sliderList!.data![index].photo!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),

                    // Featured Categories
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Featured Categories",
                          style: textStyleF18W600()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categoryList!.data!.length,
                          itemBuilder: (context, index) {
                            final category = state.categoryList!.data![index];
                            return InkWell(
                              onTap: () {

                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    // Circular Image
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(category.banner!),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      category.name!,
                                      style: textStyleF14W600(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Featured Categories
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Today's Deal Products",
                          style: textStyleF18W600()),
                    ),
                    // Today Deal
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.dealList!.data!.length,
                          itemBuilder: (context, index) {
                            final deal = state.dealList!.data![index];
                            return Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)
                              ),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 5),

                              child: Column(
                                children: [
                                  // Stack for the image and sales info
                                  Stack(
                                    children: [
                                      // Product Image
                                      Image.network(
                                        deal.thumbnailImage ?? "",
                                        width: 260,
                                        height: 170,
                                        fit: BoxFit.fill,
                                      ),

                                      // Sales Info at top-left corner
                                      Positioned(
                                        top: 5,
                                        left: 5,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "${deal.sales} sales",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // Product Name
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      deal.name ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyleF14W600(),

                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  // Price Section
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Discounted Price
                                      Text(
                                        deal.mainPrice ?? "",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 5),

                                      // Original Price (Strikethrough)
                                      if (deal.hasDiscount!)
                                        Text(
                                          deal.strokedPrice!,
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                    ],
                                  ),
                                  RatingBarIndicator(
                                    rating: double.parse(deal.rating.toString()),
                                    // Assuming rating is a double
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 16.0,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                          Text("Featured Products", style: textStyleF18W600()),
                    ),
                    // Featured Products

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 250, // Adjust height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.featuredProductList!.data!.length,
                          itemBuilder: (context, index) {
                            final product =
                                state.featuredProductList!.data![index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ProductDetailScreen.id,
                                  arguments: product.links!.details,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Stack for image and total sales info
                                    Stack(
                                      children: [
                                        // Circular Image
                                        Container(
                                          width: 260,
                                          height: 170,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  product.thumbnailImage!),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),

                                        // Total Sales Info at top-left corner
                                        Positioned(
                                          top: 5,
                                          left: 5,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "${product.sales} sales",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    // Product Name
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        product.name!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    // Price Section
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          product.mainPrice!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.red,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(width: 5),

                                        // Original Price with Strikethrough if Discounted
                                        if (product.hasDiscount!)
                                          Text(
                                            product.strokedPrice!,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                      ],
                                    ),

                                    const SizedBox(height: 5),

                                    // Rating Bar
                                    RatingBarIndicator(
                                      rating: double.parse(product.rating.toString()),
                                      // Assuming rating is a double
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 16.0,
                                      direction: Axis.horizontal,
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Failed to load data"));
            }
          },
        ),
      ),
    );
  }
}
