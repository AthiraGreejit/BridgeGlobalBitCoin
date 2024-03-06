enum AuthStatus {
  initial,
  authenticating,
  authenticated,
  unAuthenticated,
  authenticationFailed,
  unAuthorisedUser,
}

enum PageStatus {
  initial,
  loading,
  loaded,
  loadingFailed,
  updating,
  updatingFailed,
  updated,
  validationError,
  resultNotFound
}
