import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/components/default_button.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/models/rate.dart';
import 'package:smart_cashier/providers/rateProvider.dart';
import 'package:smart_cashier/providers/service/rateService.dart';

class RateApp extends StatefulWidget {
  @override
  _RateAppState createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {

  double _rating;

  double _userRating = 3.0;
  double _initialRating = 2.0;


  IconData _selectedIcon;

  @override
  void initState() {
    super.initState();
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تقيمك يهمنا'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.0,
            ),
            _heading('التقييم '),
            Center(
              child: RatingBar.builder(
                initialRating: _initialRating,
                minRating: 1,
                // textDirection:  TextDirection.rtl,
                
                allowHalfRating: true,
                unratedColor: Colors.amber.withAlpha(50),
                itemCount: 5,
                itemSize: 50.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
                updateOnDrag: true,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'التقييم: $_rating',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
                 Center(
                   child:SizedBox(
                     width: 200,
                     child: DefaultButton(
                          text: "تقييم",
                          press: () {
                            Rate rate=new Rate();
                            rate.userId=user.id.toString();
                            rate.rate=_rating;

                            RateProvider rateProvider=Provider.of(context,listen: false);
                            RatetService ratetService=new RatetService(rateProvider);
                            ratetService.addRate(rate);
                         
                          },
                        ),
                   ),
                 ),
          ],
        ),
      ),
    );
  }






  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );


}
