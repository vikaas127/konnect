import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/component/component.dart';
import 'package:konnect/component/image_utilities.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:konnect/theme/theme.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
const kSpacingUnit = 10;
const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
 // fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
//  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);
class LedgerViewPage extends StatefulWidget {
  final LedgerModal _modal;

  const LedgerViewPage(
      this._modal, {
        Key? key,
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return LedgerViewPage_state();
  }

}
class LedgerViewPage_state extends State<LedgerViewPage> {


  Widget _key(String key,String name) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        top: 2,
        bottom: 2,
      ),
      child: Container(height: 50,width: 40,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 19,
                backgroundColor: Color(0xFFE0E0E0),
                child: Padding(
                  padding: const EdgeInsets.all(6.5),
                  child: Image.asset(
                    '${key}',
                    color: MyColors.primary,),
                ),
              ),
             Text('${name}',style: theme.title8,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _value(String value) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 6,
        right: 12,
      ),
      child: Text(value,style: theme().title14b,),
    );
  }
  late Widget _picture;
  late Map profile = new Map();
  void onTap() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('From where do you want to take the photo?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Gallery'),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop();
                      File? image = await UtilsImage.getFromGallery();
                      _uploadPicture(image!);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Camera'),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop();
                      File? image = await UtilsImage.getFromCamera();
                      _uploadPicture(image!);
                    },
                  )
                ],
              ),
            ),
          );
        });
    /*ProgressDialog dialog = ProgressDialog(context);
        ImagePicker()
            .getImage(
                source: ImageSource.gallery,
                imageQuality: 85,
                maxHeight: 512,
                maxWidth: 512)
            .then((pickedFile) => {
                  print('picked file path ${pickedFile.path}'),
                  dialog.show(),
                  ApiClient().uploadFile(pickedFile.path).then((value) => {
                        setState(() {
                          Map response = value.data;
                          _imagePath = response['result'];
                          profile['image'] = response['result'];
                          print('Upload File Result ${value.data}');
                          ApiClient()
                              .updatePartyMaster(profile)
                              .then((value) => {
                                    dialog.hide().then((hide) => {
                                          setState(() {
                                            result = null;
                                            loadProfile();
                                            print(value.data);
                                          })
                                        })
                                  });
                        })
                      }),
                });*/
  }
  @override
  void initState() {
    super.initState();

    setState(setProfile);
    loadProfile();
  }
  void setProfile() {
    String _imagePath = profile == null ? '' : profile['image'] ?? '';
    _picture = _imagePath.isEmpty
        ? Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 49,
        backgroundColor: Color(0xFFE0E0E0),
        child: Padding(
          padding: const EdgeInsets.all(6.5),
          child: Icon(Icons.account_circle_outlined,size:85,color: MyColors.primary,),
        ),
      ),
    )
        : ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: FadeInImage.assetNetwork(
        width: 72,
        height: 72,
        image: _imagePath,
        placeholder: 'images/iv_empty.png',
      ),
    );
  }
  void loadProfile() async {
   /* Map response = (await ApiClient().getPartyMasterProfile(widget.id)).data;

    profile = Map();
    print(response['result']);

    Map result = response['result'];

    profile['id'] = result['id'];
    profile['name'] = result['party_master_name'];
    profile['address1'] = result['address'];
    profile['address2'] = result['address2'];
    profile['address3'] = result['address3'];
    profile['country'] = result['country'];
    profile['state'] = result['state'];
    profile['city'] = result['city'];
    profile['contact_number'] = result['contact_number'];
    profile['email'] = result['party_master_email'];
    profile['bank_name'] = result['bank_name'];
    profile['gstin'] = result['gstin'];
    profile['ifsc_code'] = result['ifsc_code'];
    profile['account_number'] = result['account_number'];
    profile['account_name'] = result['account_name'];
    profile['opening_balance'] = result['opening_balance'];
    profile['debit_credit'] = result['debit_credit'];
    profile['credit_period'] = result['credit_period'];
    profile['credit_days'] = result['credit_days'];
    profile['credit_amount'] = result['credit_amount'];
    profile['password'] = result['password'];
    profile['confirm_password'] = result['password'];
    profile['image'] = result['image'];
    profile['party_master_id'] = result['id'];
    profile['alternative_contact_number'] =
    result['alternative_contact_number'];

    profile['add_from'] = result['add_from'];
    profile['group_type'] = result['group_type'];
    profile['closingBalance'] = result['closingBalance'];

    String key = AppConstants.USER_LOGIN_CREDENTIAL;
    String credential = (await AppPreferences.getString(key));
    UserLogin login = UserLogin.formJson(credential);
    if (login.isMaster && login.isLogin) {
      UserProfile user = UserProfile.fromJson(profile);
      String key = AppConstants.USER_LOGIN_DATA;
      String json = jsonEncode(user.toJson());
      AppPreferences.setString(key, json);
      print(json);
    }

    setState(setProfile);*/
  }
  _uploadPicture(File image) async {
    /*setState(() {
      _picture = GFLoader();
    });
    Map response = (await ApiClient().uploadFile(image.path)).data;
    profile['image'] = response['result'];
    print('UploadFileResult $response');

    response = (await ApiClient().updatePartyMaster(profile)).data;
    print('ProfileUpdateResult $response');
    loadProfile();*/
  }

  @override
  Widget build(BuildContext context) {
    String address0 = '';
    String address1 = '';
    String address2 = '';
    String address3 = '';
    String address4 = '';
    String address5 = '';
    if (profile != null) {
      address0 = profile['address1'] ?? '';
      address1 = profile['address2'] ?? '';
      address2 = profile['address3'] ?? '';

      address3 = profile['city'] ?? '';
      address4 = profile['state'] ?? '';
      address5 = profile['country'] ?? '';
    }
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), title: Text('Ledger View'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child
            : ListView(
          padding: EdgeInsets.only(top: 20, bottom: 24),
          children: <Widget>[

         /*   InkWell(
              onTap: onTap,
              child: _picture,
            ),*/
          //  Divider(height: 20,),
            Header('PERSONAL DETAIL'),
            Divider(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: <Widget>[
                      Expanded(flex: 1, child: _key('assets/icons/link_user.png','name')),
                      Expanded(
                        flex: 3,
                        child: _value('${widget._modal.name}'),


                      )]),
                 Divider(),
            Row(children: <Widget>[
              Expanded(flex: 1, child: _key('assets/icons/link_user.png',"email")),
              Expanded(
                flex: 3,
                child: _value('${widget._modal.mailingName}',

                ),
              )
            ]),
            Divider(),
            Row(children: <Widget>[
              Expanded(flex: 1, child: _key('assets/icons/link_user.png',"country")),
              Expanded(
                flex: 3,
                child: _value(
                  '${widget._modal.countryName}',
                ),
              )
            ]),
            Divider(),
            Row(children: <Widget>[
              Expanded(flex: 1, child: _key('assets/gst.png','gst')),
              Expanded(
                flex: 3,
                child: _value(
                  '${widget._modal.partyGstin}',

                ),
              )
            ]),
            Divider(),
            Row(children: <Widget>[
              Expanded(flex: 1, child: _key('assets/icons/link_user.png','address')),
              Expanded(
                flex: 3,
                child: _value(
                  '${widget._modal.address}',

                ),
              )
            ]),


                  ],
                ),
              ),
            ),



            Divider(height: 24),
            Header('BANKING DETAIL'),
            Divider(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(children: <Widget>[
                      Expanded(flex: 1, child:
                      _key('assets/icons/accountholder.png','acc. holder name')),
                      Expanded(
                        flex: 3,
                        child: _value(
                          '${widget._modal.name}',

                        ),
                      )
                    ]),
                    Divider(),
                   Row(children: <Widget>[
                      Expanded(flex: 1, child:
                      _key('assets/icons/accountnumber.png','acc. no')),
                      Expanded(
                        flex: 3,
                        child: _value(
                          '${widget._modal.bankno}',

                        ),
                      )
                    ]),
                    Divider(),
                    Row(children: <Widget>[
                      Expanded(flex: 1, child: _key('assets/icons/bank.png','bankname')),
                      Expanded(
                        flex: 3,
                        child: _value(
                          '${widget._modal.bankname}'
                        ),
                      )
                    ]),
                    Divider(),
                    Row(children: <Widget>[
                      Expanded(flex: 1, child:  _key('assets/icons/IFSCcode.png','IFSC')),
                      Expanded(
                        flex: 3,
                        child: _value(
                          '${widget._modal.ifsccode}',

                        ),
                      )
                    ]),
                    Divider(),

                  ],
                ),
              ),
            ),
            Divider(height: 24),
            Header('BALANCE INFO'),

            Divider(height: 24),
            Container(
              child: Card(
                borderOnForeground: true,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(children: <Widget>[
                        Expanded(flex: 1, child:  _key('assets/icons/openingbalance.png','opning balance')),
                        Expanded(
                          flex: 3,
                          child: _value(
                            '₹ ${widget._modal.openingBalance} .00',

                          ),
                        )
                      ]),
                      Divider(),
                      Row(children: <Widget>[
                        Expanded(flex: 1, child: _key('assets/icons/openingbalance.png','closing  balance')),
                        Expanded(
                          flex: 3,
                          child: _value(
                            '₹ ${widget._modal.closingBalance}',

                          ),
                        )
                      ]),
                      Divider(height: 24),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
/*Column(
    children: <Widget>[
    SizedBox(height: kSpacingUnit* 5),
      Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 10,
            width: kSpacingUnit* 10,
            margin: EdgeInsets.only(top: kSpacingUnit * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit * 5,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit * 2.5,
                    width: kSpacingUnit * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit* 1.5,
                      widthFactor: kSpacingUnit * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        //  size: ScreenUtil().setSp(kSpacingUnit * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit * 2),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),


        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Table(
            columnWidths: {
          0: FlexColumnWidth(1.0),
          1: FlexColumnWidth(2.0),
        },
            children: <TableRow>[

          TableRow(
              children: [
            _key('Name'),
            _value('${_modal.name}'),
          ]),
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _key('GSTIN'),
            ),
            _value('${_modal.partyGstin}'),
          ]),
          TableRow(children: [
            _key('Type'),
            _value('${_modal.gstRegistrationType}'),
          ]),
          TableRow(children: [
            _key('Address'),
            _value('${_modal.address}'),
          ]),
          TableRow(children: [
            _key('State'),
            _value('${_modal.priorStateName}'),
          ]),
          TableRow(children: [
            _key('Country'),
            _value('${_modal.countryName}'),
          ]),
          TableRow(children: [
            _key('Op. Bal.'),
            _value('${_modal.openingBalance}'),
          ]),
          TableRow(children: [
            _key('Cl. Bal.'),
            _value('${_modal.closingBalance}'),
          ]),
        ]),
      ),
    ])*/


}




