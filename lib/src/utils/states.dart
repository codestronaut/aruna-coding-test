enum AppState { initial, loading, loaded, failure }

extension AppStateX on AppState {
  bool get isInitial => this == AppState.initial;
  bool get isLoading => this == AppState.loading;
  bool get isLoaded => this == AppState.loaded;
  bool get isFailure => this == AppState.failure;
}
