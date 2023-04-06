import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/global_models/recipe_model.dart';
import '../../shared/shimmer/shimmer_effect.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/text_styles.dart';
import '../main_page/home_page/viewmodel/home_page_viewmodel.dart';

class RecipeDetailPage extends StatefulHookConsumerWidget {
  const RecipeDetailPage({super.key, required this.recipeModel});
  final RecipeModel recipeModel;

  @override
  ConsumerState<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends ConsumerState<RecipeDetailPage> {
  late ScrollController _scrollController;
  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset >
            MediaQuery.of(context).size.height * .16 - kToolbarHeight;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener((() {
        setState(() {});
      }));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavourite =
        ref.read(homePageVMProvider).checkIfFavourite(widget.recipeModel);
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: false,
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * .2,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.pin,
                  titlePadding: EdgeInsets.zero,
                  title: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(bottom: _isAppBarExpanded ? 0 : 35),
                    decoration: BoxDecoration(
                      color: _isAppBarExpanded
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.2),
                    ),
                    alignment: _isAppBarExpanded
                        ? Alignment.center
                        : Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: _isAppBarExpanded
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.recipeModel.label != null
                              ? widget.recipeModel.label!.length > 35
                                  ? '${widget.recipeModel.label!.substring(0, 33)}..'
                                  : widget.recipeModel.label!
                              : 'Food',
                          style: AppTextStyles.heading6.copyWith(
                            color:
                                _isAppBarExpanded ? Colors.black : Colors.white,
                          ),
                        ),
                        !_isAppBarExpanded
                            ? Text(
                                widget.recipeModel.label != null
                                    ? widget.recipeModel.label!.length > 35
                                        ? '${widget.recipeModel.label!.substring(0, 33)}..'
                                        : widget.recipeModel.label!
                                    : 'Food',
                                style: AppTextStyles.body9.copyWith(
                                  color: _isAppBarExpanded
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  background: CachedNetworkImage(
                    imageUrl: widget.recipeModel.images?.rEGULAR?.url ?? '',
                    placeholder: (_, __) => ShimmerEffect(
                      child: Container(
                        height: 100,
                        width: 120,
                        color: Colors.white,
                      ),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                iconTheme: IconThemeData(
                    color: _isAppBarExpanded ? Colors.black : Colors.white),
                actions: [
                  IconButton(
                    onPressed: () {
                      ref.read(homePageVMProvider).clickFavouriteButton(
                          isFavourite, widget.recipeModel);
                      setState(() {});
                    },
                    icon: Icon(
                      isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: isFavourite
                          ? AppColors.primary
                          : _isAppBarExpanded
                              ? Colors.black
                              : Colors.white,
                    ),
                  )
                ],
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Center(
              child: Text(widget.recipeModel.label ?? ''),
            ),
          ),
        ),
      ),
    );
  }
}
