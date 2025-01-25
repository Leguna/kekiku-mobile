import 'package:kekiku/auth/views/profile_summary.dart';
import 'package:kekiku/core/index.dart';
import 'package:kekiku/core/widgets/rate/rating_cubit.dart';
import 'package:kekiku/core/widgets/rate/widgets/star_widget.dart';
import 'package:lottie/lottie.dart';

import '../core/widgets/my_accordion.dart';
import 'bloc/auth_cubit.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: AppBar(title: const Text(Strings.myProfile)),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loggedOut: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                ProfileSummary(
                  showEditButton: true,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.editProfile);
                  },
                ),
                const Divider(),
                // const MyAccordion(
                //   showAccordion: true,
                //   titleChild: Text(Strings.accountSettings),
                //   contentChild: Column(
                //     children: [
                //       ListTile(
                //         enabled: false,
                //         title: Text(Strings.accountSecurity),
                //         subtitle: Text(Strings.accountSecuritySubtitle),
                //         leading: Icon(Icons.security),
                //       ),
                //       ListTile(
                //         enabled: false,
                //         title: Text(Strings.notification),
                //         subtitle: Text(Strings.notificationSubtitle),
                //         leading: Icon(Icons.notifications),
                //       ),
                //     ],
                //   ),
                // ),
                // const Divider(),
                // const MyAccordion(
                //   titleChild: Text(Strings.appSettings),
                //   contentChild: Column(
                //     children: [
                //       ListTile(
                //         enabled: false,
                //         title: Text(Strings.apperance),
                //         subtitle: Text(Strings.apperanceHint),
                //         leading: Icon(Icons.color_lens),
                //       ),
                //     ],
                //   ),
                // ),
                // const Divider(),
                MyAccordion(
                  showAccordion: true,
                  titleChild: const Text(Strings.aboutKekiku),
                  contentChild: Column(
                    children: [
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, Routes.aboutKekiku);
                      //   },
                      //   subtitle: const Text(Strings.descAboutApp),
                      //   enabled: false,
                      //   title: const Text(Strings.knowMore),
                      //   leading: const Icon(Icons.info),
                      // ),
                      ListTile(
                        leading: const Icon(Icons.star),
                        title: const Text(Strings.reviewApp),
                        subtitle: const Text(Strings.rateAppDescription),
                        onTap: () {
                          showReviewAppBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                createLogoutTile(context),
              ],
            );
          },
        ));
  }

  Widget createLogoutTile(BuildContext context) {
    return ListTile(
      onTap: () {
        showMyDialogOption(
          context,
          title: Strings.exitFromKekiku,
          description: Strings.logoutConfirmation,
          confirmText: Strings.logout,
          onConfirm: () {
            BlocProvider.of<AuthCubit>(context).logout();
          },
        );
      },
      title: const Text(Strings.logout),
      leading: const Icon(Icons.logout),
    );
  }

  void showReviewAppBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        var ratingCubit = RatingCubit();
        return BlocConsumer<RatingCubit, RatingState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              submitted: () {
                Navigator.pop(context);
                ratingCubit.openAppLink(Strings.appLink);
              },
            );
          },
          bloc: ratingCubit,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      iconSize: 24,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Lottie.asset(
                    Assets.lotties.customerReview,
                    height: 200,
                    fit: BoxFit.fitWidth,
                    reverse: true,
                    alignment: Alignment.topCenter,
                    frameRate: FrameRate.max,
                  ),
                  Text(
                    Strings.rateApp,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: Dimens.tiny),
                  Text(
                    Strings.rateAppDescription,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: Dimens.tiny),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => StarWidget(
                          bloc: ratingCubit,
                          ratingPosition: index + 1,
                          onTap: ratingCubit.canRating
                              ? () {
                                  ratingCubit.setRating(index + 1);
                                }
                              : null,
                        ),
                      )),
                  const SizedBox(height: Dimens.tiny),
                  Text(ratingCubit.getRatingText(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.medium,
                      vertical: Dimens.tiny,
                    ),
                    child: ElevatedButton(
                      onPressed: ratingCubit.canSubmit
                          ? () {
                              state.maybeWhen(
                                orElse: () {},
                                rating: (_, __) {
                                  ratingCubit.submitRating();
                                },
                              );
                            }
                          : null,
                      child: state.maybeWhen(
                        orElse: () => const Text(Strings.send),
                        submitting: () => const SizedBox(
                          height: Dimens.large,
                          width: Dimens.large,
                          child: CircularProgressIndicator(),
                        ),
                        submitted: () => const Text(Strings.send),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
