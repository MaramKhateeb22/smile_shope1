import 'package:flutter/material.dart';

class SmileShopeScreen1 extends StatelessWidget {
  const SmileShopeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title:  Container(
            //
              width:MediaQuery.of(context).size.width*0.6,

              height: MediaQuery.of(context).size.height*0.06,
              child:  LayoutBuilder(builder: (context, constraints) =>
                  TextField(
                    onChanged: (text) {
                      // يمكنك إضافة منطق البحث هنا
                    },
                    controller: _dateController,
                    style: TextStyle(fontSize:  constraints.maxWidth*0.08
                      // // constraints.maxWidth*0.08
                      //   // constraints.maxWidth*0.
                    ),

                    decoration:  InputDecoration(
                      // labelText: 'التاريخ',
                      contentPadding: EdgeInsets.all(4.0),
                      hintText: 'بحث..',
                      filled: true,
                      fillColor: Colors.grey[100],

                      suffixIcon:
                      IconButton(onPressed: (){

                      },
                        icon: const Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.green,

                      ),),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.green)
                      ),
                      // BorderSide(color: Colors.red)),
                    ),

                    onTap: () {

                    },
                  ),
              )

          ),

          // bottom: TabBar(
          //   isScrollable: true, // لجعل التبويبات قابلة للتمرير
          //   tabs: List<Widget>.generate(10, (index) {
          //     // إنشاء قائمة من تبويبات
          //     return Tab(text: 'العنصر ${index + 1}');
          //   }),
          // ),
       
        ),
        body: Text('data')
        // TabBarView(
        //   children: List<Widget>.generate(10, (index) {
        //     // إنشاء قائمة من المحتويات لكل تبويب
        //     return Center(child: Text('محتوى العنصر ${index + 1}'));
        //   }),
        // ),
     
      ),
    );
  }
}
