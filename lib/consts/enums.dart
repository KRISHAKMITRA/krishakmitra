enum AppRoutes {
  home(path: '/', pathName: "Krishak"),
  details(path: '/:name', pathName: "Details"),
  create(path: '/create', pathName: "Create");

  final String path;
  final String pathName;
  const AppRoutes({required this.path, required this.pathName});
}

enum PostDetails {
  headline(key: "h1"),
  h3(key: "h3"),
  h5(key: "h5"),
  iamge(key: "image");

  final String key;
  const PostDetails({required this.key});
}
