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
            padding: EdgeInsets.all(Dimens.medium),
            child: LoginButtons(),
          );
        } else {
          return Column(
            children: [
              ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Dimens.medium,
                        left: Dimens.medium,
                      ),
                      child: Text(
                        user?.displayName ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Dimens.mediumText,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimens.nano),
                    if (user?.username != null && user?.username != '')
                      Row(
                        children: [
                          const SizedBox(width: Dimens.medium),
                          Text(
                            "@${user?.username}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    if (user?.email != null)
                      Row(
                        children: [
                          const SizedBox(width: Dimens.medium),
                          Text("${user?.email}"),
                        ],
                      )
                    else
                      Row(
                        children: [
                          const SizedBox(width: Dimens.medium),
                          const Icon(Icons.phone,
                              size: Dimens.medium, color: Colors.grey),
                          const SizedBox(width: Dimens.micro),
                          Text("${user?.phone}"),
                        ],
                      ),
                    const SizedBox(height: Dimens.medium),
                  ],
                ),
                leading: user == null
                    ? const Icon(Icons.account_circle)
                    : buildImage(user),
                onTap: () {
                  onTap?.call();
                },
                trailing: IconButton(
                  icon: Icon(showEditButton ? Icons.edit : Icons.settings,
                      size: Dimens.xlarge),
                  onPressed: () {
                    onTap?.call();
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget buildImage(User user) {
    return MyImageLoader(
      path: user.photo,
      width: Dimens.xlarge * 2,
      height: Dimens.xlarge * 2,
      radius: Dimens.xlarge * 2,
    );
  }
}
