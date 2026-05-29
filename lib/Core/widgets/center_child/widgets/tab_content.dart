import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font_style.dart';

class MobileTabContent extends StatelessWidget {

  final int index;

  const MobileTabContent({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    switch (index) {

      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Ticket Purchase",
              style: AppFontStyleColor.bigTextStyle(
                AppColors.navy500,
              ),
            ),

            const SizedBox(height: 12),

            const TextField(
              decoration: InputDecoration(
                hintText: "From",
              ),
            ),

            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                hintText: "To",
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Search Flight"),
            ),
          ],
        );

      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Online Check-in",
              style: AppFontStyleColor.bigTextStyle(
                AppColors.navy500,
              ),
            ),

            const SizedBox(height: 12),

            const TextField(
              decoration: InputDecoration(
                hintText: "Reservation Code",
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Check-in"),
            ),
          ],
        );

      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "My Trips",
              style: AppFontStyleColor.bigTextStyle(
                AppColors.navy500,
              ),
            ),

            const SizedBox(height: 12),

            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.flight),
              title: Text("Tehran → Istanbul"),
              subtitle: Text("21 May 2026"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),

            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.flight),
              title: Text("Dubai → Paris"),
              subtitle: Text("28 May 2026"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

class TabletTabContent extends StatelessWidget {
  final int index;

  const TabletTabContent({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ticket Purchase",
                style: AppFontStyleColor.bigTextStyle(
                  AppColors.navy500,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "From",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "To",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Search Flight"),
                ),
              ),
            ],
          ),
        );

      case 1:
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Online Check-in",
                style: AppFontStyleColor.bigTextStyle(
                  AppColors.navy500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Reservation Code",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text("Check-in"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

      case 2:
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Trips",
                style: AppFontStyleColor.bigTextStyle(
                  AppColors.navy500,
                ),
              ),
              const SizedBox(height:2),
              const Card(
                elevation: 1,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  leading: Icon(
                    Icons.flight,
                    color: AppColors.navy500,
                    size: 32,
                  ),
                  title: Text(
                    "Tehran → Istanbul",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text("21 May 2026"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              const SizedBox(height: 2),
              const Card(
                elevation:1,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  leading: Icon(
                    Icons.flight,
                    color: AppColors.navy500,
                    size: 32,
                  ),
                  title: Text(
                    "Dubai → Paris",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text("28 May 2026"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

class DesktopTabContent extends StatelessWidget {
  final int index;

  const DesktopTabContent({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ticket Purchase",
              style: AppFontStyleColor.bigTextStyle(
                AppColors.navy500,
              ).copyWith(fontSize: 19),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "From",
                      prefixIcon: const Icon(Icons.flight_takeoff),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "To",
                      prefixIcon: const Icon(Icons.flight_land),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Date",
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 30,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Search Flight",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );

      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Online Check-in".tr,
              style: AppFontStyleColor.bigTextStyle(
                AppColors.navy500,
              ).copyWith(fontSize: 19),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Name & Last Name",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Reservation Code".tr,
                      prefixIcon: const Icon(Icons.confirmation_number),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Check-in",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );

      case 2:
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Trips",
              style: AppFontStyleColor.bigTextStyle(AppColors.navy500)
                  .copyWith(fontSize: 19),
            ),
            const SizedBox(height: 10),

               Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 560,
                        height: 80,
                        child: _buildTripCardWidget("Tehran → Istanbul", "21 May 2026 • 14:30"),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 560,
                        height: 80,
                        child: _buildTripCardWidget("Dubai → Paris", "21 May 2026 • 14:30"),
                      ),
                    ],
                  )
            ,

          ],
        );



      default:
        return const SizedBox.shrink();
    }
  }
  Widget _buildTripCard(String title, String subtitle) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.flight, size: 40),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripCardWidget(String title, String subtitle) {
    return _buildTripCard(title, subtitle);
  }

}

