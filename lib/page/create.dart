import 'package:flutter/material.dart';

import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:36:04
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-17 09:25:48
 * @FilePath: /tech_research/forcewallet/lib/page/create.dart
 * @Description: 
 */

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  State<CreateWalletPage> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWalletPage> {
  late HDWallet wallet;
  String mnemonic = "";
  late String newAddress;
  late String ethAddress;

  @override
  void initState() {
    super.initState();
    wallet = HDWallet();
    mnemonic = wallet.mnemonic();
    newAddress = wallet.getAddressForCoin(TWCoinType.TWCoinTypeNewChain);
    ethAddress = wallet.getAddressForCoin(TWCoinType.TWCoinTypeEthereum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Wallet'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'mnemonic: $mnemonic',
          ),
          Text(
            'newAddress: $newAddress',
          ),
          Text(
            'ethAddress: $ethAddress',
          ),
          MaterialButton(
              onPressed: () => {Navigator.pushNamed(context, '/home')},
              child: const Text("confirm"))
        ],
      )),
    );
  }
}
