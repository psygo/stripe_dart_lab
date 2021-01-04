/// You can either use the `.vscode/launch.json` file or use the following
/// command on the terminal:
///
/// ```sh
/// flutter run --dart-define=STRIPE_PK_TEST=pk_test_xxx -d <device_name>
/// ```
abstract class EnvironmentConfig {
  static const String pk_test = String.fromEnvironment("STRIPE_PK_TEST");
}
