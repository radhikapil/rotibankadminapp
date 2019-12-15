import 'package:flutter/material.dart';

class FoodDonations extends StatefulWidget {
  @override
  _FoodDonationsState createState() => _FoodDonationsState();
}

class _FoodDonationsState extends State<FoodDonations>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.0),
        child: Align(
          child: Container(
            width: 0.92 * MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Food Donations',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 26.0),
                ),
                SizedBox(height: 20.0),
                TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: Color(0xFF4A90E2),
                  labelColor: Color(0xFF4A90E2),
                  unselectedLabelColor: Colors.black.withOpacity(0.8),
                  indicatorWeight: 3.0,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Form',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'UnApproved',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Approved',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'HeatMap',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
