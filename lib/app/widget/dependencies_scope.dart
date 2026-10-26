import 'package:flutter/material.dart';
import '../logic/app_dependencies.dart';

class DependenciesScope extends StatefulWidget {
  const DependenciesScope({
    super.key,
    required this.dependencies,
    required this.child,
  });
  final IAppDependencies dependencies;
  final Widget child;

  static IAppDependencies of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_DependenciesInherited>()!
      .dependencies;

  @override
  State<DependenciesScope> createState() => _DependenciesScopeState();
}

class _DependenciesScopeState extends State<DependenciesScope> {
  @override
  void dispose() {
    widget.dependencies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DependenciesInherited(
      dependencies: widget.dependencies,
      child: widget.child,
    );
  }
}

class _DependenciesInherited extends InheritedWidget {
  const _DependenciesInherited({
    required this.dependencies,
    required super.child,
  });
  final IAppDependencies dependencies;

  @override
  bool updateShouldNotify(_DependenciesInherited oldWidget) {
    return oldWidget.dependencies != dependencies;
  }
}
