import '../../core/index.dart';
import '../blocs/transaction_cubit.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.screenWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
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
                    label: "All Status",
                    isSelected: true,
                    onTap: () {
                      // Show dialog bottom sheet
                      showMyModalOptionBottomSheet(
                        context,
                        title: "Status",
                        options: ["All Status", "Success", "Failed", "Pending"],
                        onSelected: (index) {
                          final cubit = context.read<TransactionCubit>();
                          cubit.setStatusFilter([
                            "All Status",
                            "Success",
                            "Failed",
                            "Pending"
                          ][index]);
                        },
                      );
                    },
                  ),
                  const SizedBox(width: Dimens.small),
                  _filterChip(context, label: "All Type", onTap: () {}),
                  const SizedBox(width: Dimens.small),
                  _filterChip(context, label: "All Date", onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
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
