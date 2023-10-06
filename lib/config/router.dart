 import 'package:flutter/material.dart';
 import 'package:inventory/config/app_routes.dart';
import 'package:inventory/features/home/screens/home.dart';
import 'package:inventory/features/scan_details/screens/scan_details.dart';
import 'package:inventory/features/selected_details/screen/selected_detail.dart';

import '../features/scanner/screen/scanner.dart';
 Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
//   final args = routeSettings.arguments;
//   final addressIndex =routeSettings.arguments;
   switch (routeSettings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    case AppRoutes.scanner:
      return MaterialPageRoute(
        builder: (context) => const Scanner(),
      );
    case AppRoutes.scanDetails:
      return MaterialPageRoute(
        builder: (context) => const ScannerDetails(),
      );
//     case AppRoutes.otp:
//       return MaterialPageRoute(
//         builder: (context) => GetOtp(
//           arg: args as MobileNumber,
//         ),
//       );
    case AppRoutes.selectedDetails:
      return MaterialPageRoute(
        builder: (context) => const SelectedDetails(),
      );
//     case AppRoutes.walletOption:
//       return MaterialPageRoute(
//         builder: (context) => WalletOption(
//           arg: args as RequireAmt,
//         ),
//       );
//     case AppRoutes.addNewCard:
//       return MaterialPageRoute(
//         builder: (context) => const AddNewCard(),
//       );
//     case AppRoutes.coupons:
//       return MaterialPageRoute(
//         builder: (context) => const Coupons(),
//       );
//     case AppRoutes.categoryListScreen:
//       return MaterialPageRoute(
//         builder: (context) => const CategoryList(),
//       );
//     case AppRoutes.detailScreen:
//       return MaterialPageRoute(
//         builder: (context) => DetailView(
//           arg: args as ProductView,
//         ),
//       );
//     case AppRoutes.profileScreen:
//       return MaterialPageRoute(
//         builder: (context) => const ProfilePage(),
//       );
//     case AppRoutes.addressSelection:
//       return MaterialPageRoute(
//         builder: (context) => const AddressSelection(),
//       );
//     case AppRoutes.addAddress:
//       return MaterialPageRoute(
//         builder: (context) =>  AddAddress(
//           addressIndex: addressIndex,
//         ),
//       );
//     case AppRoutes.profileEditScreen:
//       return MaterialPageRoute(
//         builder: (context) => ProfileEditScreen(
//           arg: args as ProfileEdit,
//         ),
//       );
//     case AppRoutes.orderSuccess:
//       return MaterialPageRoute(
//         builder: (context) => const OrderSuccess(),
//       );
//     case AppRoutes.productListScreen:
//       return MaterialPageRoute(
//         builder: (context) => ProductList(
//           arg: args as ProductListArguments,
//         ),
//       );
//     case AppRoutes.accSettings:
//       return MaterialPageRoute(
//         builder: (context) => const AccountSettings(),
//       );
//     case AppRoutes.paymentMethod:
//       return MaterialPageRoute(
//         builder: (context) => const PaymentMethod(),
//       );
//     case AppRoutes.yourOrders:
//       return MaterialPageRoute(
//         builder: (context) => const YourOrders(),
//       );
//     case AppRoutes.refund:
//       return MaterialPageRoute(
//         builder: (context) => const RefundScreen(),
//       );
     default:
      return MaterialPageRoute(
        builder: (context) => const ErrorRoute(),
      );
   }
 }

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Page Found'),
      ),
    );
  }
}
