// favoritemodel.dart

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class FavoriteItem {
  @HiveField(0)
  final String imageUrl;

  FavoriteItem(this.imageUrl);
}
