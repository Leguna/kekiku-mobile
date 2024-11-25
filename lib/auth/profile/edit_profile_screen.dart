import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/auth/profile/profile_edit_cubit.dart';
import 'package:kekiku/core/index.dart';

import '../models/user.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return MyScaffold(
          appBar: AppBar(title: const Text(Strings.changeProfile)),
          body: Column(
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
                      context.read<AuthCubit>().changePhotoProfile();
                    },
                    child: const Text(Strings.changePhoto)),
              ),
              const Divider(thickness: 1),
              const Padding(
                padding: EdgeInsets.all(Dimens.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      Strings.publicProfile,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              const Padding(
                padding: EdgeInsets.all(Dimens.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(Strings.privateProfile,
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              Center(
                child: TextButton(
                  child: const Text(Strings.closeAccount),
                  onPressed: () {
                    showMyDialogOption(
                      context,
                      title: Strings.closeAccount,
                      description: Strings.removeAccountDescription,
                      confirmText: Strings.closeAccount,
                      onConfirm: () {
                        context.read<ProfileEditCubit>().deleteAccount();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
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
