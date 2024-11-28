import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/auth/profile/edit_profile_cubit.dart';
import 'package:kekiku/auth/profile/edit_profile_tile.dart';
import 'package:kekiku/core/index.dart';

import '../models/user.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = EditProfileCubit(context.read<AuthCubit>());
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (user) {
              context.read<AuthCubit>().user = user;
            },
            error: (message) {
              showMySnackBar(context, message);
            },
            deleted: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.home,
                (route) => false,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return MyScaffold(
            appBar: AppBar(title: const Text(Strings.changeProfile)),
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Divider(
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: Dimens.small),
                    Center(
                      child: buildImage(context.read<AuthCubit>().user!),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            bloc.changePhotoProfile();
                          },
                          child: const Text(Strings.changePhoto)),
                    ),
                    const Divider(thickness: 1),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(Dimens.small),
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
                          padding: EdgeInsets.all(Dimens.small),
                          child: Text(
                            Strings.privateProfile,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        EditProfileTile(type: ProfileField.id),
                        EditProfileTile(type: ProfileField.email),
                        EditProfileTile(type: ProfileField.phone),
                        EditProfileTile(type: ProfileField.gender),
                        EditProfileTile(type: ProfileField.birthday),
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
                            bloc.deleteAccount();
                          },
                        );
                      },
                    ),
                  ],
                ),
                state.maybeWhen(
                  loading: () => const MyLoading(),
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  CachedNetworkImage buildImage(User user) {
    return CachedNetworkImage(
      imageUrl: user.photoUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 84 / 2,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => const CircleAvatar(
        child: CircleAvatar(
          radius: 84 / 2,
          child: Icon(Icons.account_circle),
        ),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: 84 / 2,
        backgroundImage: FileImage(File(user.photoUrl)),
      ),
    );
  }
}
