import 'package:flutter/cupertino.dart';
import 'package:kekiku/core/widgets/my_dropdown_form_field.dart';

import '../../core/index.dart';
import '../models/user.dart';
import 'edit_profile_cubit.dart';

class EditProfileTile extends StatelessWidget {
  const EditProfileTile({super.key, required this.type});

  final ProfileField type;

  @override
  Widget build(BuildContext context) {
    var canEdit = type != ProfileField.id;
    var disabled = type == ProfileField.email;
    return Theme(
      data: Theme.of(context).copyWith(
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
      ),
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          var bloc = context.read<EditProfileCubit>();
          var value = getTypeValue(type, bloc.user);
          var isPhone = type == ProfileField.phone;
          var isGender = type == ProfileField.gender;
          var isBirthday = type == ProfileField.dateOfBirth;
          if (isGender) {
            value = (genderMap[value] ?? genderMap["other"])!;
          }
          return ListTile(
            enabled: !disabled,
            leading: SizedBox(
              width: MediaQuery.of(context).size.width * 0.24,
              child: Text(
                "${editProfileTypeMap[type]}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            title: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: disabled ? Colors.grey : null,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            onTap: () {
              if (!canEdit) {
                Clipboard.setData(ClipboardData(text: bloc.user?.id ?? ""));
                return;
              }
              bloc.setValue(type);
              showMyModalBottomSheet(
                context,
                title: "${Strings.edit} ${editProfileTypeMap[type]}",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isGender && !isBirthday)
                      TextField(
                        keyboardType:
                            isPhone ? TextInputType.phone : TextInputType.text,
                        controller: bloc.value,
                        decoration: InputDecoration(
                          labelText: editProfileTypeMap[type],
                        ),
                        inputFormatters: isPhone
                            ? [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(15),
                              ]
                            : null,
                        onSubmitted: (value) {
                          bloc.editProfileValue(type, value);
                          Navigator.pop(context);
                        },
                      ),
                    if (isGender)
                      buildGenderBottomSheet(
                        context,
                        value: bloc.value.text,
                      ),
                    if (isBirthday) buildBirthdayBottomSheet(context, bloc),
                    const SizedBox(height: Dimens.large),
                    ElevatedButton(
                      onPressed: () {
                        if (isBirthday) {
                          bloc.setProfileBirthday();
                        } else {
                          bloc.editProfileValue(type, bloc.value.text);
                        }
                        Navigator.pop(context);
                      },
                      child: const Text(Strings.save),
                    ),
                  ],
                ),
              );
            },
            trailing: !disabled
                ? !canEdit
                    ? const Icon(Icons.copy)
                    : const Icon(Icons.arrow_forward_ios_rounded)
                : const SizedBox(
                    width: 24,
                  ),
          );
        },
      ),
    );
  }

  Widget buildGenderBottomSheet(
    BuildContext context, {
    String value = "others",
  }) {
    return MyDropdownFormField(
      value: value,
      decoration: InputDecoration(
        labelText: editProfileTypeMap[type],
      ),
      items: genderMap.entries
          .map(
            (e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.value),
            ),
          )
          .toList(),
      onChanged: (value) {
        context.read<EditProfileCubit>().value.text = value.toString();
      },
    );
  }

  Widget buildBirthdayBottomSheet(BuildContext context, EditProfileCubit bloc) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(thickness: 1, height: 1),
        SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: 40,
                  scrollController: bloc.dayController,
                  onSelectedItemChanged: (index) {},
                  children: day
                      .map(
                        (e) => Center(
                          child: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: 40,
                  scrollController: bloc.monthController,
                  onSelectedItemChanged: (index) {},
                  children: month
                      .map(
                        (e) => Center(
                          child: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: bloc.yearController,
                  onSelectedItemChanged: (index) {},
                  children: year
                      .map(
                        (e) => Center(
                          child: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, height: 1),
      ],
    );
  }
}
