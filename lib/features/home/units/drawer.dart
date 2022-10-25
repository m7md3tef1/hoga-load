part of '../view.dart';

class OnDrawer extends StatelessWidget {
  const OnDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: const [
                        Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomRowDrawer(
              text: 'Home',
              icon: Icons.home,
              navigatename: const Home(),
            ),
            CustomRowDrawer(
              text: 'Dashboard',
              icon: Icons.dashboard,
              navigatename: const DashboardView(),
            ),
            CustomRowDrawer(
              text: 'Advertisement',
              icon: Icons.railway_alert_outlined,
              navigatename: const AdvertisementView(),
            ),
            CustomRowDrawer(
              text: 'Packages',
              icon: Icons.all_inbox_rounded,
              navigatename: const PackagesView(),
            ),
            CustomRowDrawer(
              text: 'SubscriptionDetails',
              icon: Icons.details_outlined,
              navigatename: const SubscriptionDetailsView(),
            ),
            CustomRowDrawer(
              text: 'UploadProducts',
              icon: Icons.shopping_cart_outlined,
              navigatename: const UploadProductsView(),
            ),
            CustomRowDrawer(
              text: 'UploadJobs',
              icon: Icons.work,
              navigatename: const UploadJobsView(),
            ),
            CustomRowDrawer(
              text: 'UploadVehicles',
              icon: Icons.shopping_cart_outlined,
              navigatename: const UploadVehiclesView(),
            ),
            CustomRowDrawer(
              text: 'Blogs',

              navigatename: const BlogsView(),
            ),

            CustomRowDrawer(
              text: 'ChangePass',
              icon: Icons.change_circle,
              navigatename: const ChangePassView(),
            ),
            CustomRowDrawer(
              text: 'ContactUs',
              icon: Icons.contact_support_outlined,
              navigatename: const ContactUsView(),
            ),
            CustomRowDrawer(
              text: 'Add / Update Card Details',
              icon: Icons.update,
              navigatename: const AddUpdateCardView(),
            ),
            CustomRowDrawer(
              text: 'AddProducts',
              icon: Icons.add,
              navigatename: const AddProductsView(),
            ),
            CustomRowDrawer(
              text: 'AddLoads',
              icon: Icons.add,
              navigatename: const AddLoadsView(),
            ),
            CustomRowDrawer(
              text: 'AddVehicles',
              icon: Icons.add,
              navigatename: const AddVehiclesView(),
            ),
            CustomRowDrawer(
              text: 'AboutUs',
              icon: Icons.info_outline,
              navigatename: const AboutUsView(),
            ),
          ],
        ),
      ),
    );
  }
}
