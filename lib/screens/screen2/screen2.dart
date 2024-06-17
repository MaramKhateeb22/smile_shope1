import 'package:flutter/material.dart';

class SmileShopeScreen2 extends StatelessWidget {
  const SmileShopeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الصفحة الرئيسية'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // يمكنك هنا فتح صفحة البحث أو تنفيذ وظيفة معينة
            },
          ),
          Expanded(
            child: TextField(

              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'ابحث هنا...',
              ),
              onChanged: (text) {
                // يمكنك إضافة منطق البحث هنا
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('محتوى الصفحة'),
      ),



    );
  }
}
