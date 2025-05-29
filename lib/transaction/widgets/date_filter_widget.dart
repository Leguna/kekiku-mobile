import '../../core/index.dart';
import '../blocs/transaction_cubit.dart';
import '../utils/transaction_utils.dart';

class DateFilterWidget extends StatefulWidget {
  const DateFilterWidget({super.key});

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  @override
  Widget build(BuildContext context) {
    final c = context.read<TransactionCubit>();
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var date in DateFilter.values)
              RadioListTile(
                title: Text(date.text),
                value: date,
                groupValue: c.dateFilter,
                onChanged: (value) {
                  c.chooseDateFilter(value as DateFilter);
                },
              ),
            if (c.dateFilter == DateFilter.custom) ...[
              Row(
                children: [
                  const SizedBox(width: Dimens.medium),
                  Expanded(
                    child: TextFormField(
                      controller: c.startDateController,
                      readOnly: true,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: c.startDateFilter ?? DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate: c.endDateFilter ?? DateTime.now(),
                        );
                        if (date != null) {
                          c.startDateFilter = date;
                          c.startDateController.text = date.toDateString();
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: Strings.startDate,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimens.medium),
                  Expanded(
                    child: TextFormField(
                      controller: c.endDateController,
                      readOnly: true,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: c.endDateFilter ?? DateTime.now(),
                          firstDate: c.startDateFilter ?? DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          c.endDateFilter = date;
                          c.endDateController.text = date.toDateString();
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: Strings.endDate,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimens.medium),
                ],
              ),
            ],
            const SizedBox(height: Dimens.medium),
            ElevatedButton(
              onPressed: () {
                c.confirmDateFilter(
                  startDateFilter: c.startDateFilter,
                  endDateFilter: c.endDateFilter,
                );
                Navigator.pop(context);
              },
              child: const Text(Strings.confirm),
            ),
          ],
        );
      },
    );
  }
}
