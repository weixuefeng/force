/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:36:04
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 16:35:41
 * @FilePath: /forcewallet/lib/page/home.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int mCurrentChainType = TWCoinType.TWCoinTypeNewChain;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Force Wallet'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Chain Type: '),
              DropdownButton<int>(
                value: mCurrentChainType,
                items: const [
                  DropdownMenuItem(
                    value: TWCoinType.TWCoinTypeNewChain,
                    child: Text('New Chain'),
                  ),
                  DropdownMenuItem(
                    value: TWCoinType.TWCoinTypeEthereum,
                    child: Text('Ethreum'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    mCurrentChainType = value!;
                  });
                },
              ),
            ],
          ),
          Text(
            "address",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
