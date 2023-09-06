import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitDoubleBounce(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Login': (data) async => LoginWidget(),
  'verify_phone_no': (data) async => VerifyPhoneNoWidget(),
  'Cart': (data) async => NavBarPage(initialPage: 'Cart'),
  'RegisterUser': (data) async => RegisterUserWidget(),
  'Search_Page': (data) async => NavBarPage(initialPage: 'Search_Page'),
  'ProductList': (data) async => ProductListWidget(
        slist: getParameter(data, 'slist'),
      ),
  'Product_Details': (data) async => ProductDetailsWidget(
        prid: await getDocumentParameter(
            data, 'prid', ProductMasterRecord.fromSnapshot),
        psql: getParameter(data, 'psql'),
      ),
  'Delivery_Address': (data) async => DeliveryAddressWidget(
        proid: await getDocumentParameter(
            data, 'proid', ProductMasterRecord.fromSnapshot),
        psql: getParameter(data, 'psql'),
      ),
  'Order_Confirmation': (data) async => OrderConfirmationWidget(
        proid: await getDocumentParameter(
            data, 'proid', ProductMasterRecord.fromSnapshot),
        address: await getDocumentParameter(
            data, 'address', AdressRecord.fromSnapshot),
        psql: getParameter(data, 'psql'),
      ),
  'Payment_Method': (data) async => PaymentMethodWidget(
        proid: await getDocumentParameter(
            data, 'proid', ProductMasterRecord.fromSnapshot),
      ),
  'SucessPage': (data) async => SucessPageWidget(),
  'Address': (data) async => AddressWidget(),
  'Profile': (data) async => NavBarPage(initialPage: 'Profile'),
  'EditProfile': (data) async => EditProfileWidget(
        phone: getParameter(data, 'phone'),
      ),
  'EditAddres': (data) async => EditAddresWidget(
        address: await getDocumentParameter(
            data, 'address', AdressRecord.fromSnapshot),
      ),
  'Your_Address': (data) async => YourAddressWidget(),
  'CatagoreyList': (data) async => CatagoreyListWidget(
        groupname: getParameter(data, 'groupname'),
      ),
  'MyOrders': (data) async => MyOrdersWidget(),
  'MyOrdersDetails': (data) async => MyOrdersDetailsWidget(
        odid: await getDocumentParameter(
            data, 'odid', OrderDetailsRecord.fromSnapshot),
      ),
  'Favourite': (data) async => NavBarPage(initialPage: 'Favourite'),
  'OrderHistory': (data) async => OrderHistoryWidget(),
  'Order_Details': (data) async => OrderDetailsWidget(
        odid: await getDocumentParameter(
            data, 'odid', OrderDetailsRecord.fromSnapshot),
      ),
  'Delivery_Sucess_Page': (data) async => DeliverySucessPageWidget(),
  'Post_Notification': (data) async => PostNotificationWidget(),
  'Order_ConfirmationCart': (data) async => OrderConfirmationCartWidget(
        aid: await getDocumentParameter(data, 'aid', AdressRecord.fromSnapshot),
        odid: await getDocumentParameter(
            data, 'odid', OrderDetailsRecord.fromSnapshot),
        amount: getParameter(data, 'amount'),
      ),
  'Delivery_AddressCart': (data) async => DeliveryAddressCartWidget(
        odid: await getDocumentParameter(
            data, 'odid', OrderDetailsRecord.fromSnapshot),
        amount: getParameter(data, 'amount'),
      ),
  'StartingPage': (data) async => StartingPageWidget(),
  'Loading': (data) async => LoadingWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
