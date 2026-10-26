// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthSessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthSessionEvent()';
}


}

/// @nodoc
class $AuthSessionEventCopyWith<$Res>  {
$AuthSessionEventCopyWith(AuthSessionEvent _, $Res Function(AuthSessionEvent) __);
}


/// Adds pattern-matching-related methods to [AuthSessionEvent].
extension AuthSessionEventPatterns on AuthSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateChallenge value)?  createChallenge,TResult Function( VerifyCode value)?  verifyCode,TResult Function( ResendCode value)?  resendCode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateChallenge() when createChallenge != null:
return createChallenge(_that);case VerifyCode() when verifyCode != null:
return verifyCode(_that);case ResendCode() when resendCode != null:
return resendCode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateChallenge value)  createChallenge,required TResult Function( VerifyCode value)  verifyCode,required TResult Function( ResendCode value)  resendCode,}){
final _that = this;
switch (_that) {
case CreateChallenge():
return createChallenge(_that);case VerifyCode():
return verifyCode(_that);case ResendCode():
return resendCode(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateChallenge value)?  createChallenge,TResult? Function( VerifyCode value)?  verifyCode,TResult? Function( ResendCode value)?  resendCode,}){
final _that = this;
switch (_that) {
case CreateChallenge() when createChallenge != null:
return createChallenge(_that);case VerifyCode() when verifyCode != null:
return verifyCode(_that);case ResendCode() when resendCode != null:
return resendCode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phone,  bool personalDataConsent)?  createChallenge,TResult Function( String code)?  verifyCode,TResult Function()?  resendCode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateChallenge() when createChallenge != null:
return createChallenge(_that.phone,_that.personalDataConsent);case VerifyCode() when verifyCode != null:
return verifyCode(_that.code);case ResendCode() when resendCode != null:
return resendCode();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phone,  bool personalDataConsent)  createChallenge,required TResult Function( String code)  verifyCode,required TResult Function()  resendCode,}) {final _that = this;
switch (_that) {
case CreateChallenge():
return createChallenge(_that.phone,_that.personalDataConsent);case VerifyCode():
return verifyCode(_that.code);case ResendCode():
return resendCode();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phone,  bool personalDataConsent)?  createChallenge,TResult? Function( String code)?  verifyCode,TResult? Function()?  resendCode,}) {final _that = this;
switch (_that) {
case CreateChallenge() when createChallenge != null:
return createChallenge(_that.phone,_that.personalDataConsent);case VerifyCode() when verifyCode != null:
return verifyCode(_that.code);case ResendCode() when resendCode != null:
return resendCode();case _:
  return null;

}
}

}

/// @nodoc


class CreateChallenge implements AuthSessionEvent {
  const CreateChallenge({required this.phone, required this.personalDataConsent});
  

 final  String phone;
 final  bool personalDataConsent;

/// Create a copy of AuthSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateChallengeCopyWith<CreateChallenge> get copyWith => _$CreateChallengeCopyWithImpl<CreateChallenge>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChallenge&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.personalDataConsent, personalDataConsent) || other.personalDataConsent == personalDataConsent));
}


@override
int get hashCode => Object.hash(runtimeType,phone,personalDataConsent);

@override
String toString() {
  return 'AuthSessionEvent.createChallenge(phone: $phone, personalDataConsent: $personalDataConsent)';
}


}

/// @nodoc
abstract mixin class $CreateChallengeCopyWith<$Res> implements $AuthSessionEventCopyWith<$Res> {
  factory $CreateChallengeCopyWith(CreateChallenge value, $Res Function(CreateChallenge) _then) = _$CreateChallengeCopyWithImpl;
@useResult
$Res call({
 String phone, bool personalDataConsent
});




}
/// @nodoc
class _$CreateChallengeCopyWithImpl<$Res>
    implements $CreateChallengeCopyWith<$Res> {
  _$CreateChallengeCopyWithImpl(this._self, this._then);

  final CreateChallenge _self;
  final $Res Function(CreateChallenge) _then;

/// Create a copy of AuthSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? personalDataConsent = null,}) {
  return _then(CreateChallenge(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,personalDataConsent: null == personalDataConsent ? _self.personalDataConsent : personalDataConsent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class VerifyCode implements AuthSessionEvent {
  const VerifyCode({required this.code});
  

 final  String code;

/// Create a copy of AuthSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCodeCopyWith<VerifyCode> get copyWith => _$VerifyCodeCopyWithImpl<VerifyCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCode&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'AuthSessionEvent.verifyCode(code: $code)';
}


}

/// @nodoc
abstract mixin class $VerifyCodeCopyWith<$Res> implements $AuthSessionEventCopyWith<$Res> {
  factory $VerifyCodeCopyWith(VerifyCode value, $Res Function(VerifyCode) _then) = _$VerifyCodeCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$VerifyCodeCopyWithImpl<$Res>
    implements $VerifyCodeCopyWith<$Res> {
  _$VerifyCodeCopyWithImpl(this._self, this._then);

  final VerifyCode _self;
  final $Res Function(VerifyCode) _then;

/// Create a copy of AuthSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(VerifyCode(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResendCode implements AuthSessionEvent {
  const ResendCode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthSessionEvent.resendCode()';
}


}




/// @nodoc
mixin _$AuthSessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthSessionState()';
}


}

/// @nodoc
class $AuthSessionStateCopyWith<$Res>  {
$AuthSessionStateCopyWith(AuthSessionState _, $Res Function(AuthSessionState) __);
}


/// Adds pattern-matching-related methods to [AuthSessionState].
extension AuthSessionStatePatterns on AuthSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( ChallengeCreated value)?  challengeCreated,TResult Function( InvalidCode value)?  invalidCode,TResult Function( RateLimited value)?  rateLimited,TResult Function( Authenticated value)?  authenticated,TResult Function( Failed value)?  failed,TResult Function( Loading value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ChallengeCreated() when challengeCreated != null:
return challengeCreated(_that);case InvalidCode() when invalidCode != null:
return invalidCode(_that);case RateLimited() when rateLimited != null:
return rateLimited(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Failed() when failed != null:
return failed(_that);case Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( ChallengeCreated value)  challengeCreated,required TResult Function( InvalidCode value)  invalidCode,required TResult Function( RateLimited value)  rateLimited,required TResult Function( Authenticated value)  authenticated,required TResult Function( Failed value)  failed,required TResult Function( Loading value)  loading,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case ChallengeCreated():
return challengeCreated(_that);case InvalidCode():
return invalidCode(_that);case RateLimited():
return rateLimited(_that);case Authenticated():
return authenticated(_that);case Failed():
return failed(_that);case Loading():
return loading(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( ChallengeCreated value)?  challengeCreated,TResult? Function( InvalidCode value)?  invalidCode,TResult? Function( RateLimited value)?  rateLimited,TResult? Function( Authenticated value)?  authenticated,TResult? Function( Failed value)?  failed,TResult? Function( Loading value)?  loading,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ChallengeCreated() when challengeCreated != null:
return challengeCreated(_that);case InvalidCode() when invalidCode != null:
return invalidCode(_that);case RateLimited() when rateLimited != null:
return rateLimited(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Failed() when failed != null:
return failed(_that);case Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String requestId,  OtpChallenge challenge)?  challengeCreated,TResult Function( int attemptsRemaining,  Duration retryAfter)?  invalidCode,TResult Function( Duration retryAfter,  DateTime? blockedUntil)?  rateLimited,TResult Function( AuthenticatedResponse session)?  authenticated,TResult Function( String error,  StackTrace stackTrace)?  failed,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ChallengeCreated() when challengeCreated != null:
return challengeCreated(_that.requestId,_that.challenge);case InvalidCode() when invalidCode != null:
return invalidCode(_that.attemptsRemaining,_that.retryAfter);case RateLimited() when rateLimited != null:
return rateLimited(_that.retryAfter,_that.blockedUntil);case Authenticated() when authenticated != null:
return authenticated(_that.session);case Failed() when failed != null:
return failed(_that.error,_that.stackTrace);case Loading() when loading != null:
return loading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String requestId,  OtpChallenge challenge)  challengeCreated,required TResult Function( int attemptsRemaining,  Duration retryAfter)  invalidCode,required TResult Function( Duration retryAfter,  DateTime? blockedUntil)  rateLimited,required TResult Function( AuthenticatedResponse session)  authenticated,required TResult Function( String error,  StackTrace stackTrace)  failed,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case ChallengeCreated():
return challengeCreated(_that.requestId,_that.challenge);case InvalidCode():
return invalidCode(_that.attemptsRemaining,_that.retryAfter);case RateLimited():
return rateLimited(_that.retryAfter,_that.blockedUntil);case Authenticated():
return authenticated(_that.session);case Failed():
return failed(_that.error,_that.stackTrace);case Loading():
return loading();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String requestId,  OtpChallenge challenge)?  challengeCreated,TResult? Function( int attemptsRemaining,  Duration retryAfter)?  invalidCode,TResult? Function( Duration retryAfter,  DateTime? blockedUntil)?  rateLimited,TResult? Function( AuthenticatedResponse session)?  authenticated,TResult? Function( String error,  StackTrace stackTrace)?  failed,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ChallengeCreated() when challengeCreated != null:
return challengeCreated(_that.requestId,_that.challenge);case InvalidCode() when invalidCode != null:
return invalidCode(_that.attemptsRemaining,_that.retryAfter);case RateLimited() when rateLimited != null:
return rateLimited(_that.retryAfter,_that.blockedUntil);case Authenticated() when authenticated != null:
return authenticated(_that.session);case Failed() when failed != null:
return failed(_that.error,_that.stackTrace);case Loading() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AuthSessionState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthSessionState.initial()';
}


}




/// @nodoc


class ChallengeCreated implements AuthSessionState {
  const ChallengeCreated({required this.requestId, required this.challenge});
  

 final  String requestId;
 final  OtpChallenge challenge;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeCreatedCopyWith<ChallengeCreated> get copyWith => _$ChallengeCreatedCopyWithImpl<ChallengeCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeCreated&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.challenge, challenge) || other.challenge == challenge));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,challenge);

@override
String toString() {
  return 'AuthSessionState.challengeCreated(requestId: $requestId, challenge: $challenge)';
}


}

/// @nodoc
abstract mixin class $ChallengeCreatedCopyWith<$Res> implements $AuthSessionStateCopyWith<$Res> {
  factory $ChallengeCreatedCopyWith(ChallengeCreated value, $Res Function(ChallengeCreated) _then) = _$ChallengeCreatedCopyWithImpl;
@useResult
$Res call({
 String requestId, OtpChallenge challenge
});


$OtpChallengeCopyWith<$Res> get challenge;

}
/// @nodoc
class _$ChallengeCreatedCopyWithImpl<$Res>
    implements $ChallengeCreatedCopyWith<$Res> {
  _$ChallengeCreatedCopyWithImpl(this._self, this._then);

  final ChallengeCreated _self;
  final $Res Function(ChallengeCreated) _then;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? challenge = null,}) {
  return _then(ChallengeCreated(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as OtpChallenge,
  ));
}

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtpChallengeCopyWith<$Res> get challenge {
  
  return $OtpChallengeCopyWith<$Res>(_self.challenge, (value) {
    return _then(_self.copyWith(challenge: value));
  });
}
}

/// @nodoc


class InvalidCode implements AuthSessionState {
  const InvalidCode({required this.attemptsRemaining, required this.retryAfter});
  

 final  int attemptsRemaining;
 final  Duration retryAfter;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidCodeCopyWith<InvalidCode> get copyWith => _$InvalidCodeCopyWithImpl<InvalidCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidCode&&(identical(other.attemptsRemaining, attemptsRemaining) || other.attemptsRemaining == attemptsRemaining)&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter));
}


@override
int get hashCode => Object.hash(runtimeType,attemptsRemaining,retryAfter);

@override
String toString() {
  return 'AuthSessionState.invalidCode(attemptsRemaining: $attemptsRemaining, retryAfter: $retryAfter)';
}


}

/// @nodoc
abstract mixin class $InvalidCodeCopyWith<$Res> implements $AuthSessionStateCopyWith<$Res> {
  factory $InvalidCodeCopyWith(InvalidCode value, $Res Function(InvalidCode) _then) = _$InvalidCodeCopyWithImpl;
@useResult
$Res call({
 int attemptsRemaining, Duration retryAfter
});




}
/// @nodoc
class _$InvalidCodeCopyWithImpl<$Res>
    implements $InvalidCodeCopyWith<$Res> {
  _$InvalidCodeCopyWithImpl(this._self, this._then);

  final InvalidCode _self;
  final $Res Function(InvalidCode) _then;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attemptsRemaining = null,Object? retryAfter = null,}) {
  return _then(InvalidCode(
attemptsRemaining: null == attemptsRemaining ? _self.attemptsRemaining : attemptsRemaining // ignore: cast_nullable_to_non_nullable
as int,retryAfter: null == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class RateLimited implements AuthSessionState {
  const RateLimited({required this.retryAfter, required this.blockedUntil});
  

 final  Duration retryAfter;
 final  DateTime? blockedUntil;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateLimitedCopyWith<RateLimited> get copyWith => _$RateLimitedCopyWithImpl<RateLimited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimited&&(identical(other.retryAfter, retryAfter) || other.retryAfter == retryAfter)&&(identical(other.blockedUntil, blockedUntil) || other.blockedUntil == blockedUntil));
}


@override
int get hashCode => Object.hash(runtimeType,retryAfter,blockedUntil);

@override
String toString() {
  return 'AuthSessionState.rateLimited(retryAfter: $retryAfter, blockedUntil: $blockedUntil)';
}


}

/// @nodoc
abstract mixin class $RateLimitedCopyWith<$Res> implements $AuthSessionStateCopyWith<$Res> {
  factory $RateLimitedCopyWith(RateLimited value, $Res Function(RateLimited) _then) = _$RateLimitedCopyWithImpl;
@useResult
$Res call({
 Duration retryAfter, DateTime? blockedUntil
});




}
/// @nodoc
class _$RateLimitedCopyWithImpl<$Res>
    implements $RateLimitedCopyWith<$Res> {
  _$RateLimitedCopyWithImpl(this._self, this._then);

  final RateLimited _self;
  final $Res Function(RateLimited) _then;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? retryAfter = null,Object? blockedUntil = freezed,}) {
  return _then(RateLimited(
retryAfter: null == retryAfter ? _self.retryAfter : retryAfter // ignore: cast_nullable_to_non_nullable
as Duration,blockedUntil: freezed == blockedUntil ? _self.blockedUntil : blockedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class Authenticated implements AuthSessionState {
  const Authenticated({required this.session});
  

 final  AuthenticatedResponse session;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'AuthSessionState.authenticated(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthSessionStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 AuthenticatedResponse session
});


$AuthenticatedResponseCopyWith<$Res> get session;

}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(Authenticated(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthenticatedResponse,
  ));
}

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthenticatedResponseCopyWith<$Res> get session {
  
  return $AuthenticatedResponseCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class Failed implements AuthSessionState {
  const Failed({required this.error, required this.stackTrace});
  

 final  String error;
 final  StackTrace stackTrace;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<Failed> get copyWith => _$FailedCopyWithImpl<Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed&&(identical(other.error, error) || other.error == error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,error,stackTrace);

@override
String toString() {
  return 'AuthSessionState.failed(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<$Res> implements $AuthSessionStateCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) _then) = _$FailedCopyWithImpl;
@useResult
$Res call({
 String error, StackTrace stackTrace
});




}
/// @nodoc
class _$FailedCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed _self;
  final $Res Function(Failed) _then;

/// Create a copy of AuthSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? stackTrace = null,}) {
  return _then(Failed(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,stackTrace: null == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

/// @nodoc


class Loading implements AuthSessionState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthSessionState.loading()';
}


}




// dart format on
