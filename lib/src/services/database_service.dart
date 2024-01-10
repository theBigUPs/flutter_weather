abstract interface class DatabaseService {
  Future<void> init();
  Future<void> getInstance();
  Future<void> saveUserSettings();
  Future<void> getUserSettings();
  Future<void> deleteUserSettings();

}

class FirebaseDatabaseService implements DatabaseService 
{
  @override
  Future<void> deleteUserSettings() {
    // TODO: implement deleteUserSettings
    throw UnimplementedError();
  }

  @override
  Future<void> getInstance() {
    // TODO: implement getInstance
    throw UnimplementedError();
  }

  @override
  Future<void> getUserSettings() {
    // TODO: implement getUserSettings
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserSettings() {
    // TODO: implement saveUserSettings
    throw UnimplementedError();
  }

}