import '../../core/index.dart';
import '../blocs/transaction_cubit.dart';
import 'date_filter_widget.dart';

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
              const SizedBox(width: Dimens.small),
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
                                        c.changeStatusFilter(
                                            value as TransactionStatus);
                                        Navigator.pop(context);
                                      },
                                    ),
                                ],
                              ));
                        },
                      ),
                      const SizedBox(width: Dimens.medium),
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
                                        c.changeTypeFilter(
                                            value as TransactionType);
                                        Navigator.pop(context);
                                      },
                                    ),
                                ],
                              ));
                        },
                      ),
                      const SizedBox(width: Dimens.medium),
                      _filterChip(
                        context,
                        label: c.getDateLabel,
                        isSelected: c.startDateFilter != null,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          c.chooseDateFilter(c.currentFilter);
                          showMyModalBottomSheet(context,
                              title: Strings.filter,
                              child: const DateFilterWidget());
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
        Theme.of(context).colorScheme.secondary.withAlpha(50);
    return InkWell(
      borderRadius: BorderRadius.circular(Dimens.medium),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.medium,
          vertical: Dimens.small,
        ),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(Dimens.medium),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyles.medium.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: Dimens.small),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: Dimens.large,
            ),
          ],
        ),
      ),
    );
  }
}
