part of'../view.dart';

class OnDrawer extends StatelessWidget {
  const OnDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
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
              text: 'Upload Load',
              icon: Icons.railway_alert_outlined,
              navigatename: const UploadedLoadsView(),
            ),
            CustomRowDrawer(
              text: 'Packages',
              icon: Icons.all_inbox_rounded,
              navigatename: PackagesView(),
            ),
            CustomRowDrawer(
              text: 'Subscription Details',
              icon: Icons.details_outlined,
              navigatename: const SubscriptionDetailsView(),
            ),
            CustomRowDrawer(
              text: 'Upload Product',
              icon: Icons.shopping_cart_outlined,
              navigatename: const UploadProductsView(),
            ),
            CustomRowDrawer(
              text: 'Upload Job',
              icon: Icons.work,
              navigatename: const UploadJobsView(),
            ),
            CustomRowDrawer(
              text: 'Upload Vehicle',
              icon: Icons.shopping_cart_outlined,
              navigatename: const UploadVehiclesView(),
            ),
            CustomRowDrawer(
              text: 'Blogs',
              navigatename: const BlogsView(),
            ),
            CustomRowDrawer(
              text: 'Change Pass',
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
              text: 'AboutUs',
              icon: Icons.info_outline,
              navigatename: const AboutUsView(),
            ),
            CustomRowDrawer(
              text: 'Logout',
              icon: Icons.logout_outlined,
              navigatename: Login(),
              beforeNavigate: () {
                CacheHelper.putString(SharedKeys.token, '');
                print('hellooooooo');
              },
            ),
          ],
        ),
      ),
    );
  }
}
