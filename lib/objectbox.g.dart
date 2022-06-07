import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'app/database/store_model.dart';

// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 2862116873253004059),
      name: 'StoredKeyInfo',
      lastPropertyId: const IdUid(3, 294820787657812870),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 383022680697782494),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3269695314913048156),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 294820787657812870),
            name: 'date',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 1472279463394629183),
      name: 'StoredWalletInfo',
      lastPropertyId: const IdUid(8, 7977530654528509813),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5834543983627820997),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6578407158759551212),
            name: 'coinType',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 504176083969934550),
            name: 'showAddress',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2327760758697772700),
            name: 'originAddress',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2128416301775808078),
            name: 'balance',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5137422682781642961),
            name: 'isContract',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 5283844239156730096),
            name: 'contractAddress',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7977530654528509813),
            name: 'parentId',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 1472279463394629183),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(1, 3376599098898809943),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [7708457589767788171],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        8709642831190709386,
        8113040890777577244,
        4002736664418965190
      ],
      retiredRelationUids: const [3376599098898809943],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    StoredKeyInfo: EntityDefinition<StoredKeyInfo>(
        model: _entities[0],
        toOneRelations: (StoredKeyInfo object) => [],
        toManyRelations: (StoredKeyInfo object) => {},
        getId: (StoredKeyInfo object) => object.id,
        setId: (StoredKeyInfo object, int id) {
          object.id = id;
        },
        objectToFB: (StoredKeyInfo object, fb.Builder fbb) {
          final textOffset =
              object.text == null ? null : fbb.writeString(object.text!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, textOffset);
          fbb.addInt64(2, object.date.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = StoredKeyInfo(
              text: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    StoredWalletInfo: EntityDefinition<StoredWalletInfo>(
        model: _entities[1],
        toOneRelations: (StoredWalletInfo object) => [],
        toManyRelations: (StoredWalletInfo object) => {},
        getId: (StoredWalletInfo object) => object.id,
        setId: (StoredWalletInfo object, int id) {
          object.id = id;
        },
        objectToFB: (StoredWalletInfo object, fb.Builder fbb) {
          final showAddressOffset = object.showAddress == null
              ? null
              : fbb.writeString(object.showAddress!);
          final originAddressOffset = object.originAddress == null
              ? null
              : fbb.writeString(object.originAddress!);
          final balanceOffset =
              object.balance == null ? null : fbb.writeString(object.balance!);
          final contractAddressOffset = object.contractAddress == null
              ? null
              : fbb.writeString(object.contractAddress!);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.coinType);
          fbb.addOffset(2, showAddressOffset);
          fbb.addOffset(3, originAddressOffset);
          fbb.addOffset(4, balanceOffset);
          fbb.addBool(5, object.isContract);
          fbb.addOffset(6, contractAddressOffset);
          fbb.addInt64(7, object.parentId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = StoredWalletInfo()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..coinType =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0)
            ..showAddress = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..originAddress = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 10)
            ..balance = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 12)
            ..isContract =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 14, false)
            ..contractAddress = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 16)
            ..parentId =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [StoredKeyInfo] entity fields to define ObjectBox queries.
class StoredKeyInfo_ {
  /// see [StoredKeyInfo.id]
  static final id =
      QueryIntegerProperty<StoredKeyInfo>(_entities[0].properties[0]);

  /// see [StoredKeyInfo.text]
  static final text =
      QueryStringProperty<StoredKeyInfo>(_entities[0].properties[1]);

  /// see [StoredKeyInfo.date]
  static final date =
      QueryIntegerProperty<StoredKeyInfo>(_entities[0].properties[2]);
}

/// [StoredWalletInfo] entity fields to define ObjectBox queries.
class StoredWalletInfo_ {
  /// see [StoredWalletInfo.id]
  static final id =
      QueryIntegerProperty<StoredWalletInfo>(_entities[1].properties[0]);

  /// see [StoredWalletInfo.coinType]
  static final coinType =
      QueryIntegerProperty<StoredWalletInfo>(_entities[1].properties[1]);

  /// see [StoredWalletInfo.showAddress]
  static final showAddress =
      QueryStringProperty<StoredWalletInfo>(_entities[1].properties[2]);

  /// see [StoredWalletInfo.originAddress]
  static final originAddress =
      QueryStringProperty<StoredWalletInfo>(_entities[1].properties[3]);

  /// see [StoredWalletInfo.balance]
  static final balance =
      QueryStringProperty<StoredWalletInfo>(_entities[1].properties[4]);

  /// see [StoredWalletInfo.isContract]
  static final isContract =
      QueryBooleanProperty<StoredWalletInfo>(_entities[1].properties[5]);

  /// see [StoredWalletInfo.contractAddress]
  static final contractAddress =
      QueryStringProperty<StoredWalletInfo>(_entities[1].properties[6]);

  /// see [StoredWalletInfo.parentId]
  static final parentId =
      QueryIntegerProperty<StoredWalletInfo>(_entities[1].properties[7]);
}
