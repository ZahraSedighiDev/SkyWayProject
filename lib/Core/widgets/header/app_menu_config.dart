import 'package:skywayproject/Core/routes/app_route.dart';
import 'package:skywayproject/Core/widgets/header/app_menu_models.dart';

class AppMenuConfig {
  static final List<MainMenuItem> menuItems = [
    const MainMenuItem(
      labelKey: 'Book',
      subMenu: [
        SubMenuItem(
          labelKey: 'Ticket Purchase',
          route: AppRoutes.ticketPurchase,
        ),
        SubMenuItem(
          labelKey: 'Online CheckIn',
          route: AppRoutes.onlineCheckIn,
        ),
        SubMenuItem(
          labelKey: 'Ticket Refund',
          route: AppRoutes.ticketRefund,
        ),
        SubMenuItem(
          labelKey: 'Ticket Change',
          route: AppRoutes.ticketChange,
        ),
      ],
    ),

    const MainMenuItem(
      labelKey: 'Travel Info',
      subMenu: [
        SubMenuItem(
          labelKey: 'Purchase Guide',
          route: AppRoutes.purchaseGuide,
        ),
        SubMenuItem(
          labelKey: 'Incapacitated Passangers',
          route: AppRoutes.incapacitatedPassanges,
        ),
        SubMenuItem(
          labelKey: 'Lunch Service',
          route: AppRoutes.lunchService,
        ),
        SubMenuItem(
          labelKey: 'Alive Animals',
          route: AppRoutes.aliveAnimals,
        ),
        SubMenuItem(
          labelKey: 'Booking Management Guide',
          route: AppRoutes.bookingManagementGuide,
        ),
        SubMenuItem(
          labelKey: 'Medical Cases',
          route: AppRoutes.medicalCases,
        ),
        SubMenuItem(
          labelKey: 'condition Of Counties Travel ' ,
          route: AppRoutes.conditionOfTravelToCountries,
        ),
        SubMenuItem(
          labelKey: 'Lost Luggage',
          route: AppRoutes.lostLuggage,
        ),
        SubMenuItem(
          labelKey: 'Ticket Refund Guide',
          route: AppRoutes.ticketRefundGuide,
        ),
        SubMenuItem(
          labelKey: 'Alone Child',
          route: AppRoutes.aloneChild,
        ),
        SubMenuItem(
          labelKey: 'Passanger Luggage',
          route: AppRoutes.passangerLuggage,
        ),
        SubMenuItem(
          labelKey: 'Flight Securiy',
          route: AppRoutes.flightSecuriy,
        ),
        SubMenuItem(
          labelKey: 'CheckIn Guide',
          route: AppRoutes.checkInGuide,
        ),
        SubMenuItem(
          labelKey: 'Special Meals',
          route: AppRoutes.specialMeals,
        ),
        SubMenuItem(
          labelKey: 'Forbidden Goods',
          route: AppRoutes.forbiddenGoods,
        ),
      ],
    ),

    const MainMenuItem(
      labelKey: 'During Flights',
      subMenu: [
        SubMenuItem(
          labelKey: 'SkyWay Fleet',
          route: AppRoutes.skyWayFleet,
        ),
        SubMenuItem(
          labelKey: 'Dinig',
          route: AppRoutes.dinig,
        ),
        SubMenuItem(
          labelKey: 'Seat Map',
          route: AppRoutes.seatMap,
        ),
        SubMenuItem(
          labelKey: 'inFlight Entertainments',
          route: AppRoutes.inFlightEntertainments,
        ),
        SubMenuItem(
          labelKey: 'Flight Classes',
          route: AppRoutes.flightClasses,
        ),
        SubMenuItem(
          labelKey: 'Magazine',
          route: AppRoutes.magazine,
        ),
        SubMenuItem(
          labelKey: 'Cabin Crew',
          route: AppRoutes.cabinCrew,
        ),
      ],
    ),

    const MainMenuItem(
      labelKey: 'Destinations',
      subMenu: [
        SubMenuItem(
          labelKey: 'Local Destinations',
          route: AppRoutes.localDestinations,
        ),
        SubMenuItem(
          labelKey: 'International Destinations',
          route: AppRoutes.internationalDestinations,
        ),
        SubMenuItem(
          labelKey: 'SkyWay Tourism',
          route: AppRoutes.skyWayTourism,
        ),
      ],
    ),

    const MainMenuItem(
      labelKey: 'passangers Club',
      subMenu: [
        SubMenuItem(
          labelKey: 'Club',
          route: AppRoutes.passangersClub,
        ),
      ],
    ),
  ];
}
