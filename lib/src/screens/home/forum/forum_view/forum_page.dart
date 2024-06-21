/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink/src/models/forum.dart';
import 'package:unilink/src/screens/home/forum/forum_view/forum_comment.dart';

import 'forum_page_card.dart';

class ForumPostCardComments extends StatefulWidget {
  const ForumPostCardComments(this.forumPost, {super.key});

  final Forum forumPost;

  @override
  State<ForumPostCardComments> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ForumPostCardComments> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> enroll(String comment) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    var someData = {
      'comentariu': comment,
      'user': uid,
    };

    FirebaseFirestore.instance
        .collection('forums')
        .doc(widget.forumPost.id)
        .update({
      'comments': FieldValue.arrayUnion([someData]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(widget.forumPost.title,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
          backgroundColor: Colors.white,
          bottomOpacity: 0.5,
          centerTitle: true,
          toolbarHeight: 90,
          elevation: 0.5,
          leading: Container(
            margin: const EdgeInsets.only(
              left: 20.0,
            ),
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 25,
                color: Color(int.parse("#8c52ff".substring(1, 7), radix: 16) +
                    0xFF000000),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
        body: Column(
          children: [
            ForumPostCard2(widget.forumPost, widget.forumPost.icon),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            const Text(
              'Comentarii',
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: ListView.builder(
                  itemCount: widget.forumPost.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ForumCommentCard(
                        comment: widget.forumPost.comments[index]);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: 325,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      hintText: 'Add',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      enroll(_emailController.text);
                      setState(() {
                        final uid = FirebaseAuth.instance.currentUser?.uid;
                        widget.forumPost.comments.add(Comment(
                            content: _emailController.text, creator: uid!));
                        widget.forumPost.ncomments++;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right:
                              5), // Adds padding to the right of the icon, pushing it to the left
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink/src/models/forum.dart';
import 'package:unilink/src/screens/home/forum/forum_view/forum_comment.dart';

import 'forum_page_card.dart';

class ForumPostCardComments extends StatefulWidget {
  const ForumPostCardComments(this.forumPost, {super.key});

  final Forum forumPost;

  @override
  State<ForumPostCardComments> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ForumPostCardComments> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> enroll(String comment) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    var someData = {
      'comentariu': comment,
      'user': uid,
    };

    FirebaseFirestore.instance
        .collection('forums')
        .doc(widget.forumPost.id)
        .update({
      'comments': FieldValue.arrayUnion([someData]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(widget.forumPost.title,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
          backgroundColor: Colors.white,
          bottomOpacity: 0.5,
          centerTitle: true,
          toolbarHeight: 90,
          elevation: 0.5,
          leading: Container(
            margin: const EdgeInsets.only(
              left: 20.0,
            ),
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 25,
                color: Color(int.parse("#8c52ff".substring(1, 7), radix: 16) +
                    0xFF000000),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
        body: Column(
          children: [
            ForumPostCard2(widget.forumPost, widget.forumPost.icon),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            const Text(
              'Comentarii',
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: ListView.builder(
                  itemCount: widget.forumPost.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ForumCommentCard(
                        comment: widget.forumPost.comments[index]);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        hintText: 'Add',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      enroll(_emailController.text);
                      setState(() {
                        final uid = FirebaseAuth.instance.currentUser?.uid;
                        widget.forumPost.comments.add(Comment(
                            content: _emailController.text, creator: uid!));
                        widget.forumPost.ncomments++;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right:
                              5), // Adds padding to the right of the icon, pushing it to the left
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
