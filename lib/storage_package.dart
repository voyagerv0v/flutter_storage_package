/*
 * @Author: carpenter 158287481@qq.com
 * @Date: 2022-11-01 15:52:55
 * @LastEditors: carpenter 158287481@qq.com
 * @LastEditTime: 2022-11-01 15:56:16
 * @FilePath: /storage_package/lib/storage_package.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
library storage_package;

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// ignore: non_constant_identifier_names
final StorageUnit = StorageInterface();

class StorageInterface extends _StorageImpt {}

/// 数据缓存工具
abstract class _StorageImpt {
  ///
  ///
  /// 初始化，一般项目启动前配置
  Future<bool> initStorage() async {
    bool reslut = await GetStorage.init();
    return reslut;
  }

  /// 获取当前存储对象
  GetStorage? _storage;
  GetStorage get storage {
    _storage ??= GetStorage();
    return _storage!;
  }

  /// 写入数据
  ///
  /// [key] 数据存储的键
  ///
  /// [value] 需要存入的数据
  Future<void> write(String key, dynamic value) async {
    debugPrint('StorageUnit write key=$key value=$value');
    storage.write(key, value);
  }

  /// 删除单条数据
  ///
  /// [key] 键
  Future<void> remove(String key) async {
    debugPrint('StorageUnit remove key=$key');
    storage.remove(key);
  }

  /// 读取本地存储的单一数据
  ///
  /// [key] 键
  T? read<T>(String key) {
    var value = storage.read(key);
    debugPrint('StorageUnit read key=$key value=$value');
    return value;
  }

  /// 清空所有数据
  Future<void> cleanAll() async {
    debugPrint('StorageUnit erase');

    storage.erase();
  }

  T getKeys<T>() {
    var keys = storage.getKeys();
    debugPrint('StorageUnit getKeys key=$keys');
    return keys;
  }

  T getValues<T>() {
    var value = storage.getValues();
    debugPrint('StorageUnit getValues key=$value ');

    return value;
  }
}
