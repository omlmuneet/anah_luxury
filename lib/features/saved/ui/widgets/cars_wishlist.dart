import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/saved/ui/controllers/wishlist/wish_list_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/ui/widgets/app_title_list_widget.dart';
import '../../../home/ui/widgets/product_container.dart';

class CarsWishlist extends StatelessWidget {
  const CarsWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListControllerBloc, WishListControllerState>(
      builder: (context, state) {
        if (state is WishListControllerInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (context
            .read<WishListControllerBloc>()
            .carsWishList
            .isNotEmpty) {
          return AppTitleAndListWidget(
            title: kWishList,
            onViewAllTapped: () {},
            categoryBody: SizedBox(
              height: 300,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: context
                      .read<WishListControllerBloc>()
                      .carsWishList
                      .map((e) => ProductContainer(
                            height: 200,
                            productName: e.title ?? '',
                            onProductTapped: (category, slug) {},
                            backgroundImage: e.uploadedFiles ??
                                'https://anah-v2.s3.amazonaws.com/1684499075056',
                            specifications: [
                              "${e.mileage} k Miles         ",
                              e.location ?? ''
                            ],
                          ))
                      .toList()),
            ),
          );
        }
        return SizedBox(child: Text("No Data"));
      },
    );
  }
}