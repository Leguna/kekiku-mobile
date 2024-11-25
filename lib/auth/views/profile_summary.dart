import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kekiku/auth/bloc/auth_cubit.dart';
import 'package:kekiku/auth/models/user.dart';
import 'package:kekiku/core/widgets/login_buttons.dart';

import '../../core/index.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    super.key,
    this.showEditButton = false,
    this.onTap,
  });

  final VoidCallback? onTap;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        var user = cubit.user;
        if (cubit.user == null) {
          return const Padding(
            padding: EdgeInsets.all(Dimens.small),
            child: LoginButtons(),
          );
        } else {
          return Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.person, size: Dimens.large),
                    const SizedBox(width: Dimens.small),
                    Expanded(
                      child: Text(
                        user?.displayName ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(showEditButton ? Icons.edit : Icons.settings,
                          size: Dimens.large),
                      onPressed: () {
                        onTap?.call();
                      },
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (user?.email != null)
                      Row(
                        children: [
                          const Icon(Icons.email, size: Dimens.large),
                          const SizedBox(width: Dimens.small),
                          Text(user?.email ?? ''),
                        ],
                      ),
                    if (user?.phone != null && user?.phone != '')
                      Row(
                        children: [
                          const Icon(Icons.phone, size: Dimens.large),
                          const SizedBox(width: Dimens.small),
                          Text(user?.phone ?? ''),
                        ],
                      ),
                    const SizedBox(height: Dimens.small),
                  ],
                ),
                leading: user == null
                    ? const Icon(Icons.account_circle)
                    : buildImage(user),
                onTap: () {
                  onTap?.call();
                },
              ),
            ],
          );
        }
      },
    );
  }

  CachedNetworkImage buildImage(User user) {
    return CachedNetworkImage(
      imageUrl: user.photoUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => const CircleAvatar(
        child: Icon(Icons.account_circle),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        backgroundImage: FileImage(File(user.photoUrl)),
      ),
    );
  }
}
