import 'package:get/get_navigation/get_navigation.dart';
import 'package:skywayproject/Core/routes/app_route.dart';
import 'package:skywayproject/Features/Destinations/Destinations_View/Destinations_View.dart';
import 'package:skywayproject/Features/Destinations/Destinations_binding/Destinations_binding.dart';
import 'package:skywayproject/Features/FlightMagazineAuth/FlightMagazineAuth_Binding/FlightMagazineAuth_Binding.dart';
import 'package:skywayproject/Features/FlightMagazineAuth/FlightMagazineAuth_View/FlightMagazineAuth_View.dart';
import 'package:skywayproject/Features/HomeAuth/Binding/auth_binding.dart';
import 'package:skywayproject/Features/HomeAuth/View/auth_view.dart';
import 'package:skywayproject/Features/OnlineCheckinHeaderAuth/OnlineCheckinHeaderAuth_Binding/OnlineCheckinHeaderAuth_Binding.dart';
import 'package:skywayproject/Features/OnlineCheckinHeaderAuth/OnlineCheckinHeaderAuth_View/OnlineCheckinHeaderAuth_View.dart';
import 'package:skywayproject/Features/OnlyTextAndFAQAuth/OnlyTextAndFAQAuth_Binding/OnlyTextAndFAQAuth_Binding.dart';
import 'package:skywayproject/Features/OnlyTextAndFAQAuth/OnlyTextAndFAQAuth_View/OnlyTextAndFAQAuth_View.dart';
import 'package:skywayproject/Features/OnlyTextAndFAQandRelatedPAuth/OnlyTextAndFAQandRelatedPAuth_Binding/OnlyTextAndFAQandRelatedPAuth_Binding.dart';
import 'package:skywayproject/Features/OnlyTextAndFAQandRelatedPAuth/OnlyTextAndFAQandRelatedPAuth_View/OnlyTextAndFAQandRelatedPAuth_View.dart';
import 'package:skywayproject/Features/OnlyTextAndPhotoAndFAQAuth/OnlyTextAndPhotoAndFAQAuth_Binding/OnlyTextAndPhotoAndFAQAuth_Binding.dart';
import 'package:skywayproject/Features/OnlyTextAndPhotoAndFAQAuth/OnlyTextAndPhotoAndFAQAuth_View/OnlyTextAndPhotoAndFAQAuth_View.dart';
import 'package:skywayproject/Features/OnlyTextAndRelatedPAuth/OnlyTextAndRelatedPAuth_Binding/OnlyTextAndRelatedPAuth_Binding.dart';
import 'package:skywayproject/Features/OnlyTextAndRelatedPAuth/OnlyTextAndRelatedPAuth_View/OnlyTextAndRelatedPAuth_View.dart';
import 'package:skywayproject/Features/PassangersClubAuth/PassangersClubAuth_Binding/PassangersClubAuth_Binding.dart';
import 'package:skywayproject/Features/PassangersClubAuth/PassangersClubAuth_View/PassangersClubAuth_View.dart';
import 'package:skywayproject/Features/SearchNesssecceryAuth/SearchNesssecceryAuth_Binding/SearchNesssecceryAuth_Binding.dart';
import 'package:skywayproject/Features/SearchNesssecceryAuth/SearchNesssecceryAuth_View/SearchNesssecceryAuth_View.dart';
import 'package:skywayproject/Features/SpecialPhotosAndTexts/SpecialPhotosAndTexts_Binding/SpecialPhotosAndTexts_Binding.dart';
import 'package:skywayproject/Features/SpecialPhotosAndTexts/SpecialPhotosAndTexts_View/SpecialPhotosAndTexts_View.dart';
import 'package:skywayproject/Features/TicketPurchaseHeaderAuth/TicketPurchaseHeaderAuth_Binding/TicketPurchaseHeaderAuth_Binding.dart';
import 'package:skywayproject/Features/TicketPurchaseHeaderAuth/TicketPurchaseHeaderAuth_View/TicketPurchaseHeaderAuth_View.dart';

class AppPages{
  static final pages =[
    GetPage(name : AppRoutes.auth ,
        page : () =>  const HomeView() ,
        binding : AuthBinding()),

    //book
    GetPage(name: AppRoutes.ticketPurchase ,
        page: () => const TicketpurchaseheaderauthView() ,
        binding: TicketpurchaseheaderauthBinding()),

    GetPage(name: AppRoutes.onlineCheckIn ,
        page: () => const OnlinecheckinheaderauthView()  ,
        binding: OnlinecheckinheaderauthBinding()),

    GetPage(name: AppRoutes.ticketRefund ,
        page: () => const OnlytextandfaqandrelatedpauthView() ,
        binding: OnlytextandfaqandrelatedpauthBinding()),

    GetPage(name: AppRoutes.ticketChange ,
        page: () => const OnlytextandfaqandrelatedpauthView() ,
        binding: OnlytextandfaqandrelatedpauthBinding()),


    //travel info
    GetPage(name: AppRoutes.purchaseGuide ,
        page: () => const OnlytextandfaqandrelatedpauthView() ,
        binding: OnlytextandfaqandrelatedpauthBinding()),

    GetPage(name: AppRoutes.lunchService,
        page: () => const OnlytextandrelatedpauthView(),
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.incapacitatedPassanges ,
        page: () => const OnlytextandrelatedpauthView(),
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.aliveAnimals ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.bookingManagementGuide ,
      page:() => const OnlytextandfaqandrelatedpauthView() ,
    binding: OnlytextandfaqandrelatedpauthBinding()),

    GetPage(name: AppRoutes.medicalCases ,
      page: () => const OnlytextandrelatedpauthView(),
    binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.conditionOfTravelToCountries ,
        page: () => const SearchnesssecceryauthView() ,
        binding: SearchnesssecceryauthBinding()),

    GetPage(name: AppRoutes.lostLuggage ,
        page: () => const OnlytextandfaqauthView() ,
        binding: OnlytextandfaqauthBinding()),

    GetPage(name: AppRoutes.ticketRefundGuide ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.aloneChild ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding() ),

    GetPage(name: AppRoutes.passangerLuggage ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.flightSecuriy ,
        page: () => const OnlytextandrelatedpauthView(),
        binding: OnlytextandrelatedpauthBinding() ),

    GetPage(name: AppRoutes.checkInGuide ,
        page: () => const OnlytextandfaqandrelatedpauthView() ,
        binding: OnlytextandfaqandrelatedpauthBinding()),

    GetPage(name: AppRoutes.specialMeals ,
        page: () => const OnlytextandrelatedpauthView(),
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.forbiddenGoods ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding()),


    //duting flight
    GetPage(name: AppRoutes.skyWayFleet  ,
        page:() => const SpecialphotosandtextsView() ,
  binding: SpecialphotosandtextsBinding()),

    GetPage(name: AppRoutes.dinig ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.seatMap ,
        page:() => const SpecialphotosandtextsView() ,
        binding: SpecialphotosandtextsBinding()),

    GetPage(name: AppRoutes.inFlightEntertainments ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.flightClasses ,
        page: () => const OnlytextandrelatedpauthView() ,
        binding: OnlytextandrelatedpauthBinding()),

    GetPage(name: AppRoutes.magazine ,
        page: () => const FlightmagazineauthView() ,
    binding: FlightmagazineauthBinding()),

    GetPage(name: AppRoutes.cabinCrew ,
        page: () => const OnlytextandphotoandfaqauthView() ,
    binding: OnlytextandphotoandfaqauthBinding()),

    //destinations
    GetPage(name: AppRoutes.localDestinations ,
        page:() => const DestinationsView() ,
        binding: DestinationsBinding()),

    GetPage(name: AppRoutes.internationalDestinations ,
      page:() => const DestinationsView() ,
        binding: DestinationsBinding()
    ),

    GetPage(name: AppRoutes.skyWayTourism ,
        page: () =>  const OnlytextandphotoandfaqauthView() ,
     binding: OnlytextandphotoandfaqauthBinding() ),

    //sky way and miles
    GetPage(name: AppRoutes.passangersClub ,
        page:() => const PassangersclubauthView() ,
        binding: PassangersclubauthBinding()),

  ];
}
