import 'package:simpson_viewer/utils/app_library.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.details, super.key});
  final CharacterDetails details;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          context.push(Paths.appLaunch.home.details.path, extra: details);
        },
        child: Card(
          color: context.colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: isTablet
                ? CharacterDetailCard(details: details)
                : Text(
                    details.title.trim(),
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}

class CharacterDetailCard extends StatelessWidget {
  const CharacterDetailCard({required this.details, super.key});
  final CharacterDetails details;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            details.title,
            style: context.textTheme.titleMedium,
          ),
          Divider(
            color: context.colorScheme.onPrimaryContainer,
          ),
          Text(
            details.description,
            softWrap: true,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
