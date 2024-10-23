import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              prefixIconConstraints: BoxConstraints(
                  minWidth: 24,
                  minHeight: 24
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey),
                ),
                hintText: '도로명으로 검색하세요.',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
            ),),
          TextButton.icon(
            onPressed: (){},
            icon: Icon(
              CupertinoIcons.compass,
              color: Colors.white
            ),
            label: Text('현재 위치로 찾기',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            //style: TextButton.styleFrom(
            //  minimumSize: Size(10, 48),
            //  backgroundColor: Theme.of(context).primaryColor),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: 30,
              itemBuilder: (context, index){
                return ListTile(
                  //leading: ExtendedImage.asset('assets/images/temp.jpg'),
                  title: Text('address $index'),
                  subtitle: Text('details $index'),
                  //trailing: Icon(Icons.more),
                );
              }
            ),
          ),
        ],)
    );
  }
}
