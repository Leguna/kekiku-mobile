import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/auth/profile/edit_profile_cubit.dart';
import 'package:kekiku/auth/profile/edit_profile_tile.dart';
import 'package:kekiku/core/index.dart';
import 'package:shimmer/shimmer.dart';

import '../models/user.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = EditProfileCubit(context.read<AuthCubit>());
    cubit.getUser(fullscreenLoading: true);
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          switch (state) {
            case ProfileError(:final message):
              showMySnackBar(context, message);
              break;
            case Deleted():
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.home,
                (route) => false,
              );
            case _:
              break;
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              MyScaffold(
                appBar: AppBar(title: const Text(Strings.changeProfile)),
                body: Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        await cubit.getUser(fullscreenLoading: false);
                      },
                      child: ListView(
                        children: [
                          const Divider(
                            thickness: 1,
                            height: 1,
                          ),
                          const SizedBox(height: Dimens.medium),
                          Center(
                            child: _buildImage(
                                cubit.user?.photo ?? '', cubit.isLoading),
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  cubit.changePhotoProfile();
                                },
                                child: const Text(Strings.changePhoto)),
                          ),
                          const Divider(thickness: 1),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(Dimens.medium),
                                child: Text(Strings.publicProfile),
                              ),
                              EditProfileTile(type: ProfileField.displayName),
                              EditProfileTile(type: ProfileField.username),
                              EditProfileTile(type: ProfileField.bio),
                            ],
                          ),
                          const Divider(thickness: 1),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(Dimens.medium),
                                child: Text(
                                  Strings.privateProfile,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              EditProfileTile(type: ProfileField.id),
                              EditProfileTile(type: ProfileField.email),
                              EditProfileTile(type: ProfileField.phone),
                              EditProfileTile(type: ProfileField.gender),
                              EditProfileTile(type: ProfileField.dateOfBirth),
                            ],
                          ),
                          const Divider(thickness: 1),
                          TextButton(
                            style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text(Strings.closeAccount),
                            onPressed: () {
                              showMyDialogOption(
                                context,
                                title: Strings.closeAccount,
                                description: Strings.removeAccountDescription,
                                confirmText: Strings.closeAccount,
                                onConfirm: () {
                                  cubit.deleteAccount();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              switch (state) {
                EditProfileLoading() => MyLoading(),
                _ => const SizedBox.shrink(),
              },
            ],
          );
        },
      ),
    );
  }

  Widget _buildImage(String image, bool isLoading) {
    if (image.isEmpty || image == "") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey,
          child: const CircleAvatar(
            radius: 48,
            backgroundColor: Colors.white,
          ),
        ),
      );
    }
    return MyImageLoader(
      isLoading: isLoading,
      path: image,
      radius: 1000,
    );
  }
}
