import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/home/controllers/home_controller.dart';
import 'package:forcewallet/app/service/wallet_service.dart';
import 'package:forcewallet/app/utils/extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:path/path.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletService service = Get.find<WalletService>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.85,
                    onPageChanged: (index, reason) {
                      service.setCurrentWalletId(
                          service.mStoredKeyInfos[index].id);
                    }),
                items: getList(),
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 20),
              child: Obx(() => ListView(
                    children: service.mStoredWalletMap
                                .value[service.mCurrentWalletId.value] ==
                            null
                        ? [Text("error data")]
                        : service.mStoredWalletMap
                            .value[service.mCurrentWalletId.value]!
                            .map((element) => _buildWalletItem(element))
                            .toList(),
                  )),
            ),
          ],
        ));
  }

  Widget button(int exampleNumber, String title) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Button(
          key: ValueKey('button$exampleNumber'),
          isSelected: controller.selectedChain == exampleNumber,
          exampleNumber: exampleNumber,
          title: title,
          onPressed: () {
            controller.selectedChain(exampleNumber);
          },
        ));
  }

  Widget _buildPageItem(int index, StoredKeyInfo info) {
    WalletService service = Get.find<WalletService>();

    final id = info.id.toString();
    final list = [
      {'asset': 'images/all.png'},
      {'asset': 'images/new.png'},
      {'asset': 'images/eth.png'}
    ];
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: Container(
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/card.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          height: 100,
          child: ListView(
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    '账户 $id',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    '\$0.00',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  child: Column(
                      children:
                          service.mStoredWalletMap.value[index + 1] == null
                              ? []
                              : [
                                  Obx(() => Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.only(
                                            left: 4.0, right: 4.0),
                                        child: _buildAddressItem(index + 1),
                                      )),
                                ]),
                ),
              ),
              Container(
                height: 36,
                margin: const EdgeInsets.only(left: 16, right: 16, top: 32),
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < list.length; i++)
                        Obx(() => Container(
                              width: 44,
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 4.0),
                              child: button(i + 1, list[i]['asset'] ?? ""),
                            )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildAddressItem(int index) {
    final WalletService service = Get.find<WalletService>();
    if (controller.selectedChain == 0 ||
        service.mStoredWalletMap.value[index] == null) {
      return Text('');
    } else {
      Widget w = Text('');
      service.mStoredWalletMap.value[index]!.forEach((element) {
        final addrL = element.showAddress!.substring(0, 10);
        final addrR =
            element.showAddress!.substring(element.showAddress!.length - 10);
        if (controller.selectedChain == 2 &&
            element.coinType.toCoinSymbol() == "NEW") {
          w = Row(children: [
            Text(
              "$addrL...$addrR",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Container(
              // width: 100,
              height: 16,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: InkWell(
                onTap: () => {},
                child: Image(
                  image: AssetImage("images/copy.png"),
                ),
              ),
            ),
          ]);
        } else if (controller.selectedChain == 3 &&
            element.coinType.toCoinSymbol() == "ETH") {
          w = Row(children: [
            Text(
              "$addrL...$addrR",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Container(
              // width: 100,
              height: 16,
              margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: InkWell(
                onTap: () => {},
                child: Image(
                  image: AssetImage("images/copy.png"),
                ),
              ),
            ),
          ]);
        }
      });

      return w;
    }
  }

  Widget _buildWalletItem(StoredWalletInfo element) {
    return Container(
      child: Column(
        children: [
          Text(element.coinType.toCoinSymbol()),
          Text(element.showAddress!),
          ElevatedButton(
              onPressed: (() => {controller.openWalletDetail(element)}),
              child: Text("Open"))
        ],
      ),
    );
  }

  List<Widget> getList() {
    final WalletService service = Get.find<WalletService>();
    List<Widget> list = [];
    service.mStoredKeyInfos.value
        .asMap()
        .forEach((index, value) => {list.add(_buildPageItem(index, value))});
    return list;
  }
}

class Button extends StatelessWidget {
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;
  final String title;

  const Button(
      {required Key key,
      required this.isSelected,
      required this.exampleNumber,
      required this.onPressed,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        backgroundColor: MaterialStateProperty.all(isSelected
            ? Color.fromRGBO(255, 255, 255, 0.8)
            : Color.fromRGBO(255, 255, 255, 0.2)),
      ),
      child: Image.asset(
        title,
        fit: BoxFit.fill,
      ),
      onPressed: () {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
          alignment: 0.5,
        );
        onPressed();
      },
    );
  }
}
