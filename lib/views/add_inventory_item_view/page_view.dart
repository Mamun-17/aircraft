import 'package:aircraft_inventory_management/view_models/inventory_view_model.dart';
import 'package:aircraft_inventory_management/view_models/stock_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageViewWidget extends StatefulWidget {
  Widget firstWidget;
  Widget secondWidget;
   PageViewWidget({Key? key,required this.firstWidget,required this.secondWidget}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StockViewModel>(
      builder: (context,mpv,_) {
        return PageView(
          physics: NeverScrollableScrollPhysics(),
        controller: mpv.pagecontroller,

          children: [
            widget.firstWidget,
            widget.secondWidget
          ],
        );
      }
    );
  }
}
