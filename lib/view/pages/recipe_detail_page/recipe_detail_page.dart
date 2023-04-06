import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widgets/recipe_detail_ingredients_widget.dart';
import 'widgets/recipe_detail_instructions_widget.dart';

import '../../../core/global_models/recipe_model.dart';
import '../../shared/shimmer/shimmer_effect.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/text_styles.dart';
import '../main_page/home_page/viewmodel/home_page_viewmodel.dart';
import 'constants/recipe_detail_constants.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _buildAppBar(context, isFavourite),
            ];
          },
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12,
        ),
        child: Column(
          children: [
            // Display Ingredients
            RecipeDetailIngredientsWidget(recipeModel: widget.recipeModel),
            // Display Instructions
            RecipeDetailInstructionsWidget(recipeModel: widget.recipeModel),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isFavourite) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      expandedHeight: MediaQuery.of(context).size.height * .2,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: _isAppBarExpanded ? 0 : 35),
          decoration: BoxDecoration(
            color: _isAppBarExpanded
                ? Colors.transparent
                : Colors.black.withOpacity(0.2),
          ),
          alignment:
              _isAppBarExpanded ? Alignment.center : Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.recipeModel.label != null
                  ? !_isAppBarExpanded
                      ? widget.recipeModel.label!
                      : widget.recipeModel.label!.length > 35
                          ? '${widget.recipeModel.label!.substring(0, 33)}..'
                          : widget.recipeModel.label!
                  : RecipeDetailConstants.foodText,
              style: AppTextStyles.heading6.copyWith(
                color: _isAppBarExpanded ? Colors.black : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
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
      iconTheme:
          IconThemeData(color: _isAppBarExpanded ? Colors.black : Colors.white),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(homePageVMProvider).clickFavouriteButton(
                  isFavourite,
                  widget.recipeModel,
                  fromDetailPage: true,
                );
            setState(() {});
          },
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFavourite
                ? AppColors.primary
                : _isAppBarExpanded
                    ? Colors.black
                    : Colors.white,
          ),
        )
      ],
    );
  }
}
