import 'package:simpson_viewer/utils/app_library.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.details, super.key});
  final CharacterDetails details;

  @override
  Widget build(BuildContext context) {
    return DetailsView(
      details: details,
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({required this.details, super.key});
  final CharacterDetails details;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          details.title,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: 200,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                        color: context.colorScheme.secondaryContainer,
                      ),
                      child: Image.network(
                        details.icon!,
                        loadingBuilder: (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                        ) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  l10n.aboutText,
                  style: context.textTheme.headlineSmall,
                ),
                Divider(
                  color: context.colorScheme.onSurface,
                ),
                Text(
                  details.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
