import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:my_appliances/constants/common_size.dart';
import 'package:my_appliances/start/intro_page.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final inputBorder = OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),);

  TextEditingController _phoneNumberController = TextEditingController(text: "010");
  TextEditingController _verifiNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        Size size = MediaQuery.of(context).size;

        return Scaffold(
          appBar: AppBar(
            title: Text('로그인 하기',
                style: Theme.of(context).textTheme.headlineSmall
            ),
            elevation: AppBarTheme
                .of(context)
                .elevation,
          ),
          body: Padding(
            padding: const EdgeInsets.all(common_bg_padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Row(children: [
                ExtendedImage.asset(
                  'assets/images/temp.jpg',
                  width: size.width*0.25,
                  height: size.width*0.25
                ),
                SizedBox(width: common_sm_padding),
                Text('나의 가전은 전화번호로 가입합니다.\n여러분의 개인정보는 안전히 보관되며,\n외부에 노출되지 않습니다.',
                  style: Theme.of(context).textTheme.titleMedium),
              ],),
              SizedBox(height: common_bg_padding),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                inputFormatters: [MaskedInputFormatter("000 0000 0000")],
                decoration: InputDecoration(
                  border: inputBorder,
                  focusedBorder: inputBorder,
                ),
              ),
              SizedBox(height: common_sm_padding),
              TextButton(
                  onPressed: (){},
                  child: Text('인증문자 발송'),),
            SizedBox(height: common_bg_padding),
            TextFormField(
              controller: _verifiNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: [MaskedInputFormatter("000000")],
              decoration: InputDecoration(
                border: inputBorder,
                focusedBorder: inputBorder,
              ),
            ),
            SizedBox(height: common_sm_padding),
            TextButton(
              onPressed: (){},
              child: Text('인증하기'),),
            ],),
          ),
        );
      }
    );
  }
}
