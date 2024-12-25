import 'package:kekiku/core/index.dart';
import 'package:kekiku/home/blocs/home_cubit.dart';
import 'package:kekiku/home/home_page.dart';
import 'package:kekiku/transaction/transaction_screen.dart';

import '../core/widgets/bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';
import '../favorite/favorite_page.dart';
import '../hamburger_menu/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarCubit = context.read<BottomNavBarCubit>();
    final homeCubit = context.read<HomeCubit>();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        homeCubit.tryQuitApp(context);
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
            builder: (context, state) {
              return Stack(
                children: [
                  MyScaffold(
                    bottomNavigationBar:
                        MyBottomNavBar(bloc: bottomNavBarCubit),
                    body: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: bottomNavBarCubit.pageController,
                      children: const [
                        HomePage(),
                        TransactionScreen(),
                        FavoritePage(),
                        MenuScreen(showLeading: false),
                      ],
                    ),
                  ),
                  if (homeCubit.isShowedPopupImage)
                    ImagePopup(
                      imageUrl:
                          'https://plus.unsplash.com/premium_photo-1728398068094-d3d30740000f?q=80&w=1895&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.notFound);
                      },
                      onBack: () {
                        homeCubit.closePopupImage();
                      },
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
