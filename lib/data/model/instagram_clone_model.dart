import 'package:instagram_clone/data/vos/feed_vo.dart';
import 'package:instagram_clone/network/data_agent/instagram_clone_data_agent.dart';
import 'package:instagram_clone/network/data_agent/instagram_clone_data_agent_impl.dart';

class InstagramCloneModel {
  InstagramCloneModel._();
  static final InstagramCloneModel _singleton = InstagramCloneModel._();
  factory InstagramCloneModel() => _singleton;

  final InstagramCloneDataAgent _instagramCloneDataAgent =
      InstagramCloneDataAgentImpl();

  void saveFeed(FeedVO feed) => _instagramCloneDataAgent.saveFeed(feed);
}
