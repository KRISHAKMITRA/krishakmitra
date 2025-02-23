enum AppRoutes {
  home(path: '/', pathName: "Krishak"),
  details(path: '/:name', pathName: "Details");

  final String path;
  final String pathName;
  const AppRoutes({required this.path, required this.pathName});
}
