import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/home/controllers/home_controller.dart';
import 'package:forcewallet/app/service/wallet_service.dart';
import 'package:forcewallet/app/utils/extension.dart';

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
                    children: service.mStoredWalletMap[
                                service.mCurrentWalletId.value] ==
                            null
                        ? [Text("error data")]
                        : service
                            .mStoredWalletMap[service.mCurrentWalletId.value]!
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

  Widget _buildPageItem(StoredKeyInfo info) {
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
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    '账户 $id',
                    style: TextStyle(
                      fontSize: 16.0,
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
                      fontSize: 32.0,
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
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < list.length; i++)
                        Obx(() => Container(
                              width: 48,
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
    return service.mStoredKeyInfos.value.map((info, {index}) {
      return _buildPageItem(info);
    }).toList();
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
