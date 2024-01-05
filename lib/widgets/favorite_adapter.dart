// favorite_item_adapter.dart

import 'package:hive/hive.dart';

import '../model/favoritemodel.dart';

class FavoriteItemAdapter extends TypeAdapter<FavoriteItem> {
  @override
  final int typeId = 0;

  @override
  FavoriteItem read(BinaryReader reader) {
    return FavoriteItem(reader.readString());
  }

  @override
  void write(BinaryWriter writer, FavoriteItem obj) {
    writer.writeString(obj.imageUrl);
  }
}
