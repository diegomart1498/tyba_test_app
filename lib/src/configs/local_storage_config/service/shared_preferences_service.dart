part of '../package.dart';

final sharedPreferencesServiceProvider = Provider((ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return SharedPreferencesService(sharedPreferences);
});

class SharedPreferencesService {
  final SharedPreferences _localStorage;
  SharedPreferencesService(this._localStorage);

  //Write
  Future<void> saveSearchQuery(String search) async =>
      await writeString(StorageItem(key: StorageItem.keySearch, value: search));

  Future<void> saveAbility(String ability) async => await writeString(
      StorageItem(key: StorageItem.keyAbility, value: ability));

  Future<void> writeString(StorageItem newItem) async =>
      await _localStorage.setString(
        newItem.key,
        newItem.value,
      );

  //Read
  String readString(String key) => _localStorage.getString(key) ?? '';

  String getAbility() => readString(StorageItem.keyAbility);

  String getSearchQuery() => readString(StorageItem.keySearch);

  //Clear
  void clearAll() => _localStorage.clear();
}
