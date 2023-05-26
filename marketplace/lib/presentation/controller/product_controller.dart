import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/entity/bundle.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/presentation/bloc/product/product_bloc.dart';
import 'package:marketplace/presentation/bloc/product/product_event.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductController extends GetxController {
  final bloc = ProductBloc();

  final List<YoutubePlayerController> playerControllers = [];

  final _currentPlayer = Rxn<YoutubePlayer>();
  set currentPlayer(YoutubePlayer? value) => _currentPlayer.value = value;
  YoutubePlayer? get currentPlayer => _currentPlayer.value;

  @override
  void onClose() {
    for (var controller in playerControllers) {
      controller.dispose();
    }

    super.onClose();
  }

  void fillPlayerControllers(List<Media> media) {
    if (playerControllers.isNotEmpty) return;

    for (var i = 0; i < media.length; i++) {
      if (media[i].type == MediaType.video) {
        playerControllers.add(
          YoutubePlayerController(
            initialVideoId:
                YoutubePlayer.convertUrlToId(media[i].toVideo()!)!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              disableDragSeek: true,
            ),
          ),
        );
      }
    }
  }

  void onChangeCurrentPlayer(YoutubePlayer player) {
    currentPlayer = player;
  }

  void onRefreshPage(String id) {
    bloc.add(ProductEvent.onLoaded(id: id));
  }

  void onProductClick(BuildContext context, CompactProduct product) {
    context.router.pushNamed('/product/${product.id}');
  }

  void onBundleProductClick(BuildContext context, Bundle bundle) {}

  void onBundleDesiredClick(BuildContext context, Bundle bundle) {}

  void onCartClick(BuildContext context) {}

  void onDesiredClick(BuildContext context) {}
}
