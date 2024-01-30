import 'package:instagram_clone/data/vos/feed_vo.dart';

abstract class InstagramCloneDataAgent {
  Future saveFeed(FeedVO feed);
}
