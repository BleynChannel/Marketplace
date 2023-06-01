import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:marketplace/domain/entity/compact_product.dart';

class FirebaseUtils {
  static Future<Uint8List?> loadImage(String path) {
    return FirebaseStorage.instance.ref(path).getData();
  }

  static Future<CompactProduct> packProduct(DocumentReference product) async {
    final data =
        await product.get().then((doc) => doc.data()! as Map<String, dynamic>);

    data['id'] = product.id;

    final banner = await product
        .collection('media')
        .where('type', isEqualTo: 'image')
        .get()
        .then((c) =>
            c.docs.isNotEmpty ? c.docs.first.data()['url'] as String : null);

    if (banner != null) {
      data['banner'] = await FirebaseUtils.loadImage(banner);
    }

    return CompactProduct.fromMap(data);
  }
}
