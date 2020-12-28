import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_test_sp/models/post.dart';
import 'package:block_test_sp/models/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(PostState initialState,this.repo) : super(PostInitial());
Reposetorey repo;
  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
if(event is PosFetch){
  yield LoadingState();
      try{
var posts=await repo.fetchData();
if(posts!=null){
  yield PostSuccess(posts: posts);

}else{
  yield LoadingState();
}
      }catch(e){
yield FetchError(e);

      }

}
  }
}
