import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class ItemViewPage extends StatefulWidget {
  final ItemModal _modal;

  const ItemViewPage(
    this._modal, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
  return _ItemDetail_State();
  }


}


class _ItemDetail_State extends State<ItemViewPage> {
  Widget _key(String key) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        top: 6,
        bottom: 6,
      ),
      child: Text(key),
    );
  }
  Widget _value(String value) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 6,
        right: 12,
      ),
      child: Text(value),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Product Detail")),

   /*   Column(
        children: [
          Column(children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: ListView(children: <Widget>[
                  GFCarousel(
                    height: 200,
                    items: images.map((_image) {
                      return GestureDetector(
                         onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ImageSliderViewScreen(
                                    images: images,
                                    position: 0,
                                  ),
                            ),
                          );
                        },
                        child: FadeInImage.assetNetwork(
                          height: 200,
                          image: _image,
                          width: _screenWidth,
                          placeholder: 'images/iv_empty.png',
                        ),
                      );
                    }).toList(),
                    autoPlay: true,
                    pagination: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index) {
                      setState(() {
                        index;
                      });
                    },
                  ),
                  Divider(color: Colors.white),
                  Text(
                    _productDetails.name.toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.white),
                  Row(children: <Widget>[
                    Text(
                      '₹ $_tradePrice /-',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹ $_price /-',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.red.shade900,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ]),
                  Divider(height: 6, color: Colors.white),
                  Text(
                    '(GST@' + _productDetails.gstRate + '% Exclusive)',
                    style:
                    TextStyle(fontSize: 12, color: Colors.green.shade400),
                  ),
                  Divider(
                      height: 36, thickness: 6, color: Colors.grey.shade100),
                  showStock(),
                  showOffers(),
                  showVariant(_screenWidth),
                  showSpecification(),
                  showReturnPolicy(),
                ]),
              ),
            ),
          *//*
           MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                height: 55,
                onPressed: () {
                  if (_productDetails.itemList.isEmpty) {
                    CartSummery existingItem = cart.firstWhere(
                            (itemToCheck) => itemToCheck.id == _productDetails.id,
                        orElse: () => null);
                    if (existingItem == null) {
                      setState(() {
                        cart.add(
                            CartSummery.fromProductDetails(_productDetails));
                        String key = AppConstants.USER_CART_DATA;
                        AppPreferences.setString(key, jsonEncode(cart));
                        print(jsonEncode(cart));
                        print('Item Added');
                      });

                      AwesomeDialog(
                          title: 'Success',
                          context: context,
                          animType: AnimType.SCALE,
                          dismissOnTouchOutside: false,
                          btnOkIcon: Icons.check_circle,
                          dialogType: DialogType.SUCCES,
                          desc: 'Item add to cart successfully!',
                          btnCancelText: 'Back',
                          btnCancelOnPress: () {
                            Navigator.of(context).pop(true);
                          }).show();
                    } else {
                      AwesomeDialog(
                          title: 'Error',
                          context: context,
                          animType: AnimType.SCALE,
                          dismissOnTouchOutside: false,
                          btnOkIcon: Icons.check_circle,
                          dialogType: DialogType.ERROR,
                          desc: 'Item already added!',
                          btnCancelText: 'Cancel',
                          btnCancelOnPress: () {}).show();
                    }
                  }
                  //
                  else {
                    showGroupedCheckbox(_productDetails.itemList);
                  }
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )),*//*
          ]),
          Table(columnWidths: {
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(2.0),
          },
              children: <TableRow>
          [
            TableRow(children: [
              _key('Name'),
              _value('${widget._modal.name}'),
            ]),
            TableRow(children: [
              _key('Parent'),
              _value('${widget._modal.parent}'),
            ]),
            TableRow(children: [
              _key('HSN Code'),
              _value('${widget._modal.stockDetails?.hsnCode}'),
            ]),
            TableRow(children: [
              _key('Tax Ability'),
              _value('${widget._modal.stockDetails?.taxAbility}'),
            ]),
            ...(widget._modal.taxDetails ?? []).skip(2).take(1)
                .map(
                  (e) => TableRow(children: [
                _key('${e.gstRateDutuHead}'),
                _key('${e.gstrate} %'),
              ]),).toList()
          ]),
        ],
      ),*/
    );
  }
  @override
  void initState() {
    super.initState();

  }
  /*Widget showStock() {
    if (_productDetails.checkStock == '1') {
      return Text(
        'IN STOCK - ' + widget._modal.stockDetails ??
            '0' + ' ' + _productDetails.unit,
        style: TextStyle(fontSize: 15, color: Colors.green.shade400),
      );
    }
    return SizedBox(height: 1);
  }
  Widget showOffers() {
    if (_productDetails.offer.isNotEmpty) {
      return Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Offer : ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 3, bottom: 15),
            child: Text(
              _productDetails.offer,
              style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ]);
    }
    return SizedBox(height: 1);
  }
  Widget showReturnPolicy() {
    if (_productDetails.returnPolicy.isEmpty) {
      return SizedBox(height: 1);
    }
    return Column(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            'Return Policy : ',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            _productDetails.returnPolicy,
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
        ),
      ),
    ]);
  }
  Widget showSpecification() {
    if (_productDetails.specification1.isEmpty) {
      return SizedBox(height: 1);
    }
    return Column(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Description',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            _productDetails.specification1,
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            _productDetails.specification2,
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            _productDetails.specification3,
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
        ),
      ),
      Divider(height: 46, thickness: 6, color: Colors.grey.shade100),
    ]);
  }
  Widget showVariant(var _screenWidth) {
    var _count = 3; //_crossAxisCount
    var _spacing = 8; //_crossAxisSpacing
    var _cellHeight = 35; // _gridCellHeight

    var _width = (_screenWidth - ((_count - 1) * _spacing)) / _count;
    var _aspectRatio = _width / _cellHeight;

    if (_productDetails.itemList.isEmpty) {
      return SizedBox(height: 1);
    } else
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Available In : ',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _count, childAspectRatio: _aspectRatio),
              itemCount: _productDetails.itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(3),
                  child: GFButton(
                    color: Colors.black54,
                    textColor: Colors.black87,
                    type: GFButtonType.outline,
                    onPressed: () {
                      setState(() {
                        _tradePrice =
                            _productDetails.itemList[index].paramsTradePrice;
                        _price = _productDetails.itemList[index].paramsMrp;
                      });
                    },
                    text: _productDetails.itemList[index].paramsOne +
                        ' - ' +
                        _productDetails.itemList[index].paramsTwo,
                  ),
                );
              },
            ),
            Divider(height: 46, thickness: 6, color: Colors.grey.shade100),
          ],
        ),
      );
  }
  void showGroupedCheckbox(List<ArrayItemList> itemList) {
    List<ArrayItemList> selectedItemList = List<ArrayItemList>();
    print('button clicked addToCartProduct');
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      body: Container(
        width: 400,
        child: GroupedCheckbox(
            itemList: itemList,
            onChanged: (itemList) {
              setState(() {
                selectedItemList = itemList;
                //print('SELECTED ITEM LIST $itemList');
              });
            },
            orientation: CheckboxOrientation.VERTICAL,
            checkColor: Colors.blue,
            activeColor: Colors.grey),
      ),
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        print('button clicked btnOkOnPress');
        selectedItemList.forEach((item) => {
          print('Params One ' + item.paramsOne),
          print('Params Two ' + item.paramsTwo),
          setState(() {
            cart.add(
              CartSummery(
                _productDetails.id,
                _productDetails.unit,
                _productDetails.image,
                item.paramsTradePrice,
                _productDetails.gstRate,
                _productDetails.name,
                _productDetails.moq,
                _productDetails.stock,
                _productDetails.checkStock,
                item.paramsOne + ' ' + item.paramsTwo,
                _productDetails.price,
                '1',
                _productDetails.discount,
                _productDetails.discountOn,
              ),
            );
            String key = AppConstants.USER_CART_DATA;
            AppPreferences.setString(key, jsonEncode(cart));
            print(jsonEncode(cart));
            print('Item Added');
            Navigator.of(context).pop(true);
          }),
        });
      },
    ).show();
  }*/
}
