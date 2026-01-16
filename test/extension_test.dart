import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';

void main() {
  group("Test extension function", () {
    test("test Currency", () {
      int money = 100000000;
      final value = money.currencyString;
      final test = '100.000.000đ';
      expect(value, test);
    });

    test("test Currency", () {
      String link = 'https://cms.nnphonghoa.langthongminh.vn/api/web/qr-code?url=https://cms.htx.marveltek.dev/truy-xuat/.html';
    });


    test("decode", () {
      String link = '{"docId": "1234"}';
      final b = jsonDecode(link) as Map<String,dynamic>;

      print(b);
      print(jsonEncode(b));

    });

    test("test valid URL", () {
      String link1 = 'https://crm.meeyland.com/api/web/qr-code?url=https://cms.nnphonghoa.langthongminh.vn/truy-xuat/6107cafaa854c9ac78f0973e.html';
      String link2 = 'https://cms.nnphonghoa.langthongminh.vn/api/web/qr-code?url=https://cms.nnphonghoa.langthongminh.vn/truy-xuat/.html';
      print(link1.isMarvelTekLink);
      print(link2.isMarvelTekLink);
    });
  });
}
