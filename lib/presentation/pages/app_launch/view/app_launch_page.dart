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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Character Viewer',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome',
              style: context.textTheme.headlineMedium,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.push(Paths.appLaunch.home.path);
                },
                child: const Text(
                  'Get Started',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
