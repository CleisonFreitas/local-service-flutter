import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_texts.dart';
import 'package:local_services/shared/components/card_service.dart';
import 'package:local_services/shared/components/card_worker.dart';
import 'package:local_services/shared/components/custom_banner_slider.dart';
import 'package:local_services/shared/components/custom_subtitle.dart';
import 'package:local_services/shared/components/custom_title.dart';

class BookingHome extends StatelessWidget {
  const BookingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomTitle(title: 'Hello, Cleison'),
          const SizedBox(height: 8),
          CustomSubtitle(
            title: 'Find the service you want, and treat yourself',
          ),
          const SizedBox(height: 16),
          CustomBannerSlider(
            banners: [
              Image.asset(
                'assets/images/banner_1.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.asset(
                'assets/images/banner_2.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.asset(
                'assets/images/banner_3.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),
          const SizedBox(height: 22),
          Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What do you want to do?', style: AppTexts.subtitle2.bold),
              GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CardService(icon: Icons.plumbing, description: 'Plumbing'),
                  CardService(
                    icon: Icons.electrical_services,
                    description: 'Electrician',
                  ),
                  CardService(
                    icon: Icons.cleaning_services,
                    description: 'Cleaning',
                  ),
                  CardService(icon: Icons.handyman, description: 'Repairs'),
                  CardService(icon: Icons.kitchen, description: 'Appliance'),
                  CardService(
                    icon: Icons.bug_report,
                    description: 'Pest Control',
                  ),
                  CardService(
                    icon: Icons.local_shipping,
                    description: 'Moving',
                  ),
                  CardService(icon: Icons.park, description: 'Gardening'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text('People most well rated!', style: AppTexts.subtitle2.bold),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: <Widget>[
                    CardWorker(image: 'assets/images/workers/man_1.jpg'),
                    CardWorker(image: 'assets/images/workers/woman.jpg'),
                    CardWorker(image: 'assets/images/workers/man_2.jpg'),
                    CardWorker(image: 'assets/images/workers/woman_2.jpg'),
                    CardWorker(image: 'assets/images/workers/woman.jpg'),
                    CardWorker(image: 'assets/images/workers/man_1.jpg'),
                    CardWorker(image: 'assets/images/workers/man_2.jpg'),
                    CardWorker(image: 'assets/images/workers/woman.jpg'),
                    CardWorker(image: 'assets/images/workers/woman_2.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
