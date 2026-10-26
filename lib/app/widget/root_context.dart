import 'package:ui_kit/ui_kit.dart';
import '../logic/app_dependencies.dart';
import 'dependencies_scope.dart';

class RootContext extends StatelessWidget {
  const RootContext({
    super.key,
    required this.dependencies,
    required this.child,
  });
  final IAppDependencies dependencies;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(dependencies: dependencies, child: child);
  }
}
