class MoviesAppExceptions implements Exception {
  final String message;
  const MoviesAppExceptions(this.message);
}

class RemoteExpetion extends MoviesAppExceptions {
  const RemoteExpetion(super.message);
}

class LocalExpetion extends MoviesAppExceptions {
  const LocalExpetion(super.message);
}
