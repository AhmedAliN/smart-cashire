
// import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/constants.dart';
// import 'package:smart_cashier/data_variables/ui_data.dart';
// import 'package:smart_cashier/models/comments.dart';
import 'package:smart_cashier/models/rate.dart';
// import 'package:smart_cashier/providers/commentProvider.dart';
import 'package:smart_cashier/providers/rateProvider.dart';
// import 'package:smart_cashier/providers/service/commentService.dart';
import 'package:smart_cashier/providers/service/rateService.dart';

class RateAll extends StatefulWidget {
  @override
  _RateAllState createState() => _RateAllState();
}

class _RateAllState extends State<RateAll> {

  RateProvider rateProvider;
  RatetService ratesService;
   @override
  void initState() {
    super.initState();
    rateProvider=Provider.of<RateProvider>(context,listen: false);
    ratesService=new RatetService(rateProvider);
    ratesService.getRate();


  }
  Widget rateChild(List<Rate> rates) {
    return ListView(
      children: rates.map((e) => 
       Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                 
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                     child: Text(
                       e.firstName.substring(0,1),
                     ),
                      ),
                ),
              ),
              title: Text(
               e.firstName +' '+e.lastName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle:
              RatingBar.builder(
                initialRating :( e.rate),
                // minRating: 1,
                // textDirection:  TextDirection.rtl,
                
                allowHalfRating: true,
                unratedColor: Colors.amber.withAlpha(50),
                itemCount: 5,
                itemSize: 10.0,
                // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ), onRatingUpdate: (double value) {  },
                // onRatingUpdate: (rating) {
                //   setState(() {
                //     _rating = rating;
                //   });
                // },
                // updateOnDrag: true,
              ),
            ),
          )
      ).toList(),
        
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التقييمات",style:TextStyle(color: Gold_color)),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child:Consumer<RateProvider>(builder: (context, model, child) {
                if (model.load) {
            return Center(child: CircularProgressIndicator());
          } else if (model.hasError || model.rate.isEmpty) {
            return Center(
              child: Text('noDAta'),
            );
          } else {
            return rateChild(model.rate);
            }
            
          }),
      ),
    );
  }
}