import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class StoredKeyInfo {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  int id = 0;

  String? text;

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime date;

  // An empty default constructor is needed but you can use optional args.
  StoredKeyInfo({this.text, DateTime? date}) : date = date ?? DateTime.now();

  // Note: just for logs in the examples below(), not needed by ObjectBox.
  @override
  toString() => 'StoredKeyInfo{id: $id, text: $text}';
}

@Entity()
class StoredWalletInfo {
  int id = 0;
  int parentId = -1;
  int coinType = 0;
  String? showAddress;
  String? originAddress;
  String? balance;
  bool isContract = false;
  String? contractAddress;
}

@Entity()
class NetworkConfig {
  int id = 0;
  int coinType = 0;
  int networkId = 0; // chain id
  String? networkName; // network name, eg: Newton TestNet
  String? rpcUrl; // rpc url
  bool isDefault = false;

  static fromJson(element) {
    var networkConfig = NetworkConfig();
    networkConfig.coinType = element['coinType'];
    networkConfig.networkId = element['networkId'];
    networkConfig.networkName = element['networkName'];
    networkConfig.rpcUrl = element['rpcUrl'];
    networkConfig.isDefault = element['isDefault'];
    return networkConfig;
  }
}

class NetworkBuilder {
  var _mCoinType = 0;
  int _mNetworkId = 0; // chain id
  String? _mNetworkName; // network name, eg: Newton TestNet
  String? _mRpcUrl; // rpc url
  bool _mIsDefault = false;

  static final NetworkBuilder _singleton = NetworkBuilder();

  NetworkBuilder coinType(int coinType) {
    _singleton._mCoinType = coinType;
    return _singleton;
  }

  NetworkBuilder networkdId(int networkdId) {
    _singleton._mNetworkId = networkdId;
    return _singleton;
  }

  NetworkBuilder networkName(String networkName) {
    _singleton._mNetworkName = networkName;
    return _singleton;
  }

  NetworkBuilder rpcUrl(String rpcUrl) {
    _singleton._mRpcUrl = rpcUrl;
    return _singleton;
  }

  NetworkBuilder setDefault(bool isDefault) {
    _singleton._mIsDefault = isDefault;
    return _singleton;
  }

  NetworkConfig build() {
    var networkConfig = NetworkConfig();
    networkConfig.coinType = _singleton._mCoinType;
    networkConfig.networkId = _singleton._mNetworkId;
    networkConfig.networkName = _singleton._mNetworkName;
    networkConfig.rpcUrl = _singleton._mRpcUrl;
    networkConfig.isDefault = _singleton._mIsDefault;
    return networkConfig;
  }
}
