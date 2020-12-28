import 'package:block_test_sp/models/post.dart';
import 'package:block_test_sp/models/repo.dart';
import 'package:block_test_sp/postbloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => PostBloc(PostInitial(), Reposetorey()),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
PostBloc bloc;
  int _counter = 0;
@override
  void initState() {
bloc=BlocProvider.of(context);
bloc.add(PosFetch());
    super.initState();
  }
@override
void dispose() {
  bloc.close();
  super.dispose();
}
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostSuccess) {
              return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Expanded(child: Text(state.posts[index].body)),
                      leading: Text(state.posts[index].id.toString()),


                    );

                  });
            }
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
