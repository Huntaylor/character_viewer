import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:simpson_viewer/utils/app_library.dart';

class AppLaunchPage extends StatelessWidget {
  const AppLaunchPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const AppLaunchView();
  }
}

class AppLaunchView extends StatelessWidget {
  const AppLaunchView({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10.appLaunchTitle,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    l10.appLaunchHeadline,
                    textStyle: context.textTheme.headlineMedium,
                    speed: const Duration(milliseconds: 100),
                    cursor: l10.appLaunchAnimationCursor,
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.push(Paths.appLaunch.home.path);
                },
                child: Text(
                  l10.appLaunchButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
