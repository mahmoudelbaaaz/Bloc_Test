part of 'post_bloc.dart';

@immutable
abstract class PostState {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}
class PostFailure extends PostState {}
class LoadingState extends PostState{}

class PostSuccess extends PostState {

  List<post>posts;

  PostSuccess({this.posts});
}
class FetchError extends PostState{
  String message;
  FetchError(message);
}

