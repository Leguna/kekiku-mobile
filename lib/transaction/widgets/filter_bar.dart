import '../../core/index.dart';
import '../blocs/transaction_cubit.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        final c = context.read<TransactionCubit>();
        return SizedBox(
          width: Dimens.screenWidth,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 16),
              if (c.isFiltering())
                IconButton(
                  onPressed: () {
                    c.clear(tags: true);
                  },
                  icon: const Icon(Icons.close),
                ),
              const SizedBox(width: Dimens.tiny),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _filterChip(
                        context,
                        label: c.statusFilter.text,
                        isSelected: c.statusFilter != TransactionStatus.none,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showMyModalBottomSheet(context,
                              title: Strings.filter,
                              child: Column(
                                children: [
                                  for (var status in TransactionStatus.values)
                                    RadioListTile(
                                      title: Text(status.text),
                                      value: status,
                                      groupValue: c.statusFilter,
                                      onChanged: (value) {
                                        c.statusFilter =
                                            value as TransactionStatus;
                                        Navigator.pop(context);
                                      },
                                    ),
                                ],
                              ));
                        },
                      ),
                      const SizedBox(width: Dimens.small),
                      _filterChip(
                        context,
                        label: c.typeFilter.text,
                        isSelected: c.typeFilter != TransactionType.none,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showMyModalBottomSheet(context,
                              title: Strings.filter,
                              child: Column(
                                children: [
                                  for (var type in TransactionType.values)
                                    RadioListTile(
                                      title: Text(type.text),
                                      value: type,
                                      groupValue: c.typeFilter,
                                      onChanged: (value) {
                                        c.typeFilter = value as TransactionType;
                                        Navigator.pop(context);
                                      },
                                    ),
                                ],
                              ));
                        },
                      ),
                      const SizedBox(width: Dimens.small),
                      _filterChip(
                        context,
                        isSelected: c.startDateFilter != null,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showMyModalBottomSheet(context,
                              title: Strings.filter,
                              child: Column(
                                children: [
                                  // 1 Month
                                  RadioListTile(
                                    title: Text("1 Month"),
                                    value: 1,
                                    groupValue: c.startDateFilter,
                                    onChanged: (value) {
                                      c.setDateTime(
                                        DateTime.now().subtract(
                                          const Duration(days: 30),
                                        ),
                                        DateTime.now(),
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                  // 3 Months
                                  RadioListTile(
                                    title: Text("3 Months"),
                                    value: 3,
                                    groupValue: c.startDateFilter,
                                    onChanged: (value) {
                                      c.setDateTime(
                                        DateTime.now().subtract(
                                          const Duration(days: 90),
                                        ),
                                        DateTime.now(),
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                  // 6 Months
                                  RadioListTile(
                                    title: Text("6 Months"),
                                    value: 6,
                                    groupValue: c.startDateFilter,
                                    onChanged: (value) {
                                      c.setDateTime(
                                        DateTime.now().subtract(
                                          const Duration(days: 180),
                                        ),
                                        DateTime.now(),
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _filterChip(
    BuildContext context, {
    String label = "All",
    bool isSelected = false,
    Function()? onTap,
  }) {
    final selectedColor = Theme.of(context).colorScheme.secondary;
    final unselectedColor =
        Theme.of(context).colorScheme.secondary.withOpacity(0.2);
    return InkWell(
      borderRadius: BorderRadius.circular(Dimens.small),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.small,
          vertical: Dimens.tiny,
        ),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(Dimens.small),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyles.medium.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: Dimens.tiny),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: Dimens.medium,
            ),
          ],
        ),
      ),
    );
  }
}
