import 'package:flutter/widgets.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshWidget extends StatelessWidget {
  final RefreshController refreshController;
  final ScrollController? scrollController;
  final Function()? onRefresh;
  final Function()? onLoading;
  final Widget child;

  const PullToRefreshWidget({Key? key, required this.refreshController, this.onRefresh, this.onLoading, required this.child, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      physics: BouncingScrollPhysics(),
      header: MaterialClassicHeader(
        color: AppColors.primaryGreen,
      ),
      controller: refreshController,
      scrollController: scrollController,
      // scrollController: scrollController,
      onRefresh: onRefresh,
      enablePullUp: true,
      onLoading: onLoading,
      footer: CustomFooter(
        builder: (ctx, mode) {
          return Container();
        },
        height: 1,
      ),
      child: child,
    );
  }
}
