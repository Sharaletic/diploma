sealed class UserEntity {
  const UserEntity._();

  const factory UserEntity.authenticated({
    required String uid,
    required String displayName,
    required String email,
    required String? photoUrl,
  }) = AuthenticatedUser;

  const factory UserEntity.unauthenticated() = NotAuthenticatedUser;

  bool get isAuthenticated;
  bool get isNotAuthenticated => !isAuthenticated;

  T when<T extends Object?>({
    required final T Function(AuthenticatedUser) authenticated,
    required final T Function() unauthenticated,
  });
}

final class AuthenticatedUser extends UserEntity {
  const AuthenticatedUser({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  }) : super._();

  final String uid;
  final String? displayName;
  final String email;
  final String? photoUrl;

  @override
  bool get isAuthenticated => true;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUser) authenticated,
    required final T Function() unauthenticated,
  }) => authenticated(this);

  AuthenticatedUser copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? photoUrl,
  }) => AuthenticatedUser(
    uid: uid ?? this.uid,
    displayName: displayName ?? this.displayName,
    email: email ?? this.email,
    photoUrl: photoUrl ?? this.photoUrl,
  );

  @override
  int get hashCode => uid.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AuthenticatedUser && uid == other.uid;

  @override
  String toString() =>
      '''AuthenticatedUser{
      id: $uid, 
      displayName: $displayName, 
      email: $email, 
      photoUrl: $photoUrl
      }''';
}

final class NotAuthenticatedUser extends UserEntity {
  const NotAuthenticatedUser() : super._();

  @override
  bool get isAuthenticated => false;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUser) authenticated,
    required final T Function() unauthenticated,
  }) => unauthenticated();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AuthenticatedUser;

  @override
  String toString() => 'AuthenticatedUser{}';
}
