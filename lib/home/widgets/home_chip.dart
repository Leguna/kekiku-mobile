import '../../core/index.dart';

class HomeChip extends StatelessWidget {
  const HomeChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 8),
          for (var i = 0; i < chips.length; i++) ...[
            MyChip(data: chips[i]),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

List<ChipData> chips = [
  ChipData(
      label: 'Rp.0',
      leading: const Icon(
        Icons.wallet,
        color: Colors.green,
      )),
  ChipData(
      label: 'My Voucher',
      leading: const Icon(
        Icons.card_giftcard,
        color: Colors.yellow,
      )),
  ChipData(
      label: 'Delivery Address',
      leading: const Icon(
        Icons.location_on,
        color: Colors.blue,
      )),
];