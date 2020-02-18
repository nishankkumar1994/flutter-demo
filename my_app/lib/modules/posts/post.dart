import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/modules/posts/services.dart';

import 'models.dart';

class PostList extends StatefulWidget {
  @override
  PostListState createState() => new PostListState();
}

class PostListState extends State<PostList> {

  List<Post> _post = List<Post>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {
    PostService().fetchList().then((post) =>
    {
      setState(() =>
      {
        _post = post
      })
    });
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: Text(_post[index].title),
      subtitle: Text(
          _post[index].body, style: TextStyle(fontSize: 18)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post List'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView.builder(
          itemCount: _post.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }
}