import '../index.dart';

class IconButtonLabeled extends StatelessWidget {
  const IconButtonLabeled({
    super.key,
    this.badgeText = '',
    this.icon,
    this.label = '',
    this.onTap,
  });

  final String badgeText;
  final Widget? icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: onTap ??
          () {
            Navigator.of(context).pushNamed(Routes.notFound);
          },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64.0),
                    color: Theme.of(context).primaryColorDark,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: IconButtonBadged(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.all(0),
                    icon: icon ??
                        const Icon(
                          Icons.not_interested,
                          size: 32,
                          color: Colors.grey,
                        ),
                  ),
                ),
                // Badge
                if (badgeText.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        badgeText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
