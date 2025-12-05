class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final Map<String, String> _users = {};

  String? _currentUserEmail;
  String? get currentUserEmail => _currentUserEmail;

  Future<bool> signUp(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (_users.containsKey(email)) return false;
    _users[email] = password;
    _currentUserEmail = email;
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final pass = _users[email];
    if (pass == null) return false;
    if (pass != password) return false;
    _currentUserEmail = email;
    return true;
  }

  void signOut() {
    _currentUserEmail = null;
  }
}
