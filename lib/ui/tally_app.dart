import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/component/route_name.dart';
import 'package:konnect/services/firestore_services.dart';
import 'package:konnect/theme/mycolors.dart';

import 'package:provider/provider.dart';

import 'home.dart';
import 'index/index.dart';
import 'login/login.dart';
import 'account/account.dart';
import 'network/connectivity.dart';

var scaffoldKey = GlobalKey<ScaffoldMessengerState>();
Route _onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (BuildContext context) {
      switch (settings.name) {
        case LOGIN:
          return LoginPage();
        case INDEX:
          return IndexPage();

        case ACCOUNT:
          return AccountPage();

        case LEDGER:
          return LedgerPage();
        case ITEMS:
          return ItemsPage();
        case GROUPS:
          return GroupsPage();

        case SALES:
          return SalesPage();
        case DEBIT:
          return DebitPage();
        case CREDIT:
          return CreditPage();
        case STOCK:
          return StockPage();
        case RECEIPT:
          return ReceiptsPage();
        case PAYMENT:
          return PaymentsPage();
        case PURCHASE:
          return PurchasePage();
        case STATEMENT:
          return StatementPage();

        case ITEMS_VIEW:
          var modal = settings.arguments;
          return ItemViewPage(modal as ItemModal);
        case GROUPS_VIEW:
          var modal = settings.arguments;
          return GroupViewPage(modal as GroupModal);
        case LEDGER_VIEW:
          var modal = settings.arguments;
          return LedgerViewPage(modal as LedgerModal);

        case SALES_VIEW:
          var modal = settings.arguments;
          return SalesViewPage(modal as InvoiceModal);
        case DEBIT_VIEW:
          var modal = settings.arguments;
          return DebitViewPage(modal as InvoiceModal);
        case CREDIT_VIEW:
          var modal = settings.arguments;
          return CreditViewPage(modal as InvoiceModal);
        case STOCK_VIEW:
          var modal = settings.arguments;
          return StockViewPage(modal as StockModal);
        case RECEIPT_VIEW:
          var modal = settings.arguments;
          return ReceiptsViewPage(modal as InvoiceModal);
        case PAYMENT_VIEW:
          var modal = settings.arguments;
          return PaymentsViewPage(modal as InvoiceModal);
        case PURCHASE_VIEW:
          var modal = settings.arguments;
          return PurchaseViewPage(modal as InvoiceModal);
        case STATEMENT_VIEW:
          var modal = settings.arguments;
          return StatementViewPage(modal as StatementModal);

        default:
          return Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(
              child: Text(
                '${settings.name} route not found',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          );
      }
    },
    settings: settings,
  );
}
Widget startApp() => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PeriodsModal()),
        ChangeNotifierProvider(create: (_) => AuthModel()),
        ChangeNotifierProvider(create: (_) => Network()),
        ProxyProvider<AuthModel, FirestoreServices>(
          update: (_, user, __) => FirestoreServices(user.uid),
        ),
        Consumer<Network>(
          builder: (_, network, child) {
            var state = scaffoldKey.currentState;
            if (network.none && state != null) {
              state.showSnackBar(
                SnackBar(
                  content: Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Text(
                      'Lost internet connection',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }
            return Container(child: child);
          },
        )
      ],
      child: MaterialApp(
        home: DoubleBack(
          child: Consumer2<AuthModel, Network>(
            builder: (_, auth, network, __) => network.none
                ? NoConnectivity()
                : auth.isSignedIn
                    ? LoginPage()
                    : home(),
          ),
        ),
        theme: ThemeData(
          primaryColor: MyColors.primary,
          accentColor: MyColors.primary,
          primaryColorDark: MyColors.primary,
          primaryColorLight: MyColors.primary,
          //fontFamily: 'Times New Roman',

          inputDecorationTheme: InputDecorationTheme(
fillColor: Color(0xffff7f50),
            filled: true,

            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        scaffoldMessengerKey: scaffoldKey,
        onGenerateRoute: _onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
