// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticated_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticatedResponse {

 AuthStatus get authStatus; String get accessToken; String get refreshToken; TokenType get tokenType; int get accessExpiresIn; int get refreshExpiresIn;
/// Create a copy of AuthenticatedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedResponseCopyWith<AuthenticatedResponse> get copyWith => _$AuthenticatedResponseCopyWithImpl<AuthenticatedResponse>(this as AuthenticatedResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedResponse&&(identical(other.authStatus, authStatus) || other.authStatus == authStatus)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.accessExpiresIn, accessExpiresIn) || other.accessExpiresIn == accessExpiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn));
}


@override
int get hashCode => Object.hash(runtimeType,authStatus,accessToken,refreshToken,tokenType,accessExpiresIn,refreshExpiresIn);



}

/// @nodoc
abstract mixin class $AuthenticatedResponseCopyWith<$Res>  {
  factory $AuthenticatedResponseCopyWith(AuthenticatedResponse value, $Res Function(AuthenticatedResponse) _then) = _$AuthenticatedResponseCopyWithImpl;
@useResult
$Res call({
 AuthStatus authStatus, String accessToken, String refreshToken, TokenType tokenType, int accessExpiresIn, int refreshExpiresIn
});




}
/// @nodoc
class _$AuthenticatedResponseCopyWithImpl<$Res>
    implements $AuthenticatedResponseCopyWith<$Res> {
  _$AuthenticatedResponseCopyWithImpl(this._self, this._then);

  final AuthenticatedResponse _self;
  final $Res Function(AuthenticatedResponse) _then;

/// Create a copy of AuthenticatedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authStatus = null,Object? accessToken = null,Object? refreshToken = null,Object? tokenType = null,Object? accessExpiresIn = null,Object? refreshExpiresIn = null,}) {
  return _then(_self.copyWith(
authStatus: null == authStatus ? _self.authStatus : authStatus // ignore: cast_nullable_to_non_nullable
as AuthStatus,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as TokenType,accessExpiresIn: null == accessExpiresIn ? _self.accessExpiresIn : accessExpiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthenticatedResponse].
extension AuthenticatedResponsePatterns on AuthenticatedResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticatedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticatedResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticatedResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticatedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticatedResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthStatus authStatus,  String accessToken,  String refreshToken,  TokenType tokenType,  int accessExpiresIn,  int refreshExpiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticatedResponse() when $default != null:
return $default(_that.authStatus,_that.accessToken,_that.refreshToken,_that.tokenType,_that.accessExpiresIn,_that.refreshExpiresIn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthStatus authStatus,  String accessToken,  String refreshToken,  TokenType tokenType,  int accessExpiresIn,  int refreshExpiresIn)  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedResponse():
return $default(_that.authStatus,_that.accessToken,_that.refreshToken,_that.tokenType,_that.accessExpiresIn,_that.refreshExpiresIn);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthStatus authStatus,  String accessToken,  String refreshToken,  TokenType tokenType,  int accessExpiresIn,  int refreshExpiresIn)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticatedResponse() when $default != null:
return $default(_that.authStatus,_that.accessToken,_that.refreshToken,_that.tokenType,_that.accessExpiresIn,_that.refreshExpiresIn);case _:
  return null;

}
}

}

/// @nodoc


class _AuthenticatedResponse extends AuthenticatedResponse {
  const _AuthenticatedResponse({required this.authStatus, required this.accessToken, required this.refreshToken, required this.tokenType, required this.accessExpiresIn, required this.refreshExpiresIn}): super._();
  

@override final  AuthStatus authStatus;
@override final  String accessToken;
@override final  String refreshToken;
@override final  TokenType tokenType;
@override final  int accessExpiresIn;
@override final  int refreshExpiresIn;

/// Create a copy of AuthenticatedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedResponseCopyWith<_AuthenticatedResponse> get copyWith => __$AuthenticatedResponseCopyWithImpl<_AuthenticatedResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticatedResponse&&(identical(other.authStatus, authStatus) || other.authStatus == authStatus)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.accessExpiresIn, accessExpiresIn) || other.accessExpiresIn == accessExpiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn));
}


@override
int get hashCode => Object.hash(runtimeType,authStatus,accessToken,refreshToken,tokenType,accessExpiresIn,refreshExpiresIn);



}

/// @nodoc
abstract mixin class _$AuthenticatedResponseCopyWith<$Res> implements $AuthenticatedResponseCopyWith<$Res> {
  factory _$AuthenticatedResponseCopyWith(_AuthenticatedResponse value, $Res Function(_AuthenticatedResponse) _then) = __$AuthenticatedResponseCopyWithImpl;
@override @useResult
$Res call({
 AuthStatus authStatus, String accessToken, String refreshToken, TokenType tokenType, int accessExpiresIn, int refreshExpiresIn
});




}
/// @nodoc
class __$AuthenticatedResponseCopyWithImpl<$Res>
    implements _$AuthenticatedResponseCopyWith<$Res> {
  __$AuthenticatedResponseCopyWithImpl(this._self, this._then);

  final _AuthenticatedResponse _self;
  final $Res Function(_AuthenticatedResponse) _then;

/// Create a copy of AuthenticatedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authStatus = null,Object? accessToken = null,Object? refreshToken = null,Object? tokenType = null,Object? accessExpiresIn = null,Object? refreshExpiresIn = null,}) {
  return _then(_AuthenticatedResponse(
authStatus: null == authStatus ? _self.authStatus : authStatus // ignore: cast_nullable_to_non_nullable
as AuthStatus,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as TokenType,accessExpiresIn: null == accessExpiresIn ? _self.accessExpiresIn : accessExpiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
