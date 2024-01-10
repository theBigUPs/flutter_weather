abstract interface class Auth {
  Future<void> init();
  Future<void> getInstance();
  Future<void> loginUser();
  Future<void> signInUser();
  Future<void> checkPresence();
}

class FirebaseAuthService implements Auth {
  @override
  Future<void> checkPresence() {
    // TODO: implement checkPresence
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> loginUser() {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<void> signInUser() {
    // TODO: implement signInUser
    throw UnimplementedError();
  }
  
  @override
  Future<void> getInstance() {
    // TODO: implement getInstance
    throw UnimplementedError();
  }
}