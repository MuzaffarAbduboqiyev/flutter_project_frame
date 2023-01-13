import 'package:flutter/material.dart';
import 'package:flutter_core/ui/util/refresh/refresh_header.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RefreshWidget extends StatelessWidget {
  final RefreshController refreshController;
  final Function refresh;
  final Widget body;
  final bool enableUpRefresh;
  final bool enableDownRefresh;

  const RefreshWidget({
    required this.refreshController,
    required this.refresh,
    required this.body,
    this.enableUpRefresh = false,
    this.enableDownRefresh = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SmartRefresher(
        controller: refreshController,
        enablePullUp: enableUpRefresh,
        enablePullDown: true,
        onRefresh: () => refresh.call(),
        header: refreshHeader(),
        physics: const BouncingScrollPhysics(),
        child: body,
      ),
    );
  }
}
