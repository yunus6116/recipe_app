import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();
const String kAppBarTitle = "RecipeApp";
const double kDesignWidth = 375;
const double kDesignHeight = 812;
const String baseUrl = 'https://api.edamam.com/api/recipes/v2';
