import 'package:firebase_database/firebase_database.dart';
import 'package:instagram_clone/data/vos/feed_vo.dart';
import 'package:instagram_clone/network/data_agent/instagram_clone_data_agent.dart';

const kFeedPath = 'feed';

class InstagramCloneDataAgentImpl extends InstagramCloneDataAgent {
  InstagramCloneDataAgentImpl._();
  static final InstagramCloneDataAgentImpl _singleton =
      InstagramCloneDataAgentImpl._();
  factory InstagramCloneDataAgentImpl() => _singleton;

  final databaseRef = FirebaseDatabase.instance.ref();

  @override
  Future saveFeed(FeedVO feed) =>
      databaseRef.child(kFeedPath).child(feed.id.toString()).set(feed.toJson());
}
