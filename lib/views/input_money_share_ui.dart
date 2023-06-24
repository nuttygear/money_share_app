// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_share_app/views/show_money_share_ui.dart';

class InputMoneyShareUI extends StatefulWidget {
  const InputMoneyShareUI({super.key});

  @override
  State<InputMoneyShareUI> createState() => _InputMoneyShareUIState();
}

class _InputMoneyShareUIState extends State<InputMoneyShareUI> {
  //สร้างออปเจ็กต์ควบคุม TextField
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  //สร้างตัวแปรเพื่อควบคุม Checkbox
  bool tipCheck = false;

  //สร้างเมธอดแสดง dialog แบบ warning dialog
  _showWarningDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Color.fromARGB(255, 224, 79, 95),
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.itim(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.itim(
              color: Color.fromARGB(255, 224, 79, 95),
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 79, 95),
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.itim(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 165, 165),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 246, 79, 95),
          title: Text(
            'แชร์เงินกันเถอะ',
            style: GoogleFonts.itim(
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        //Icons.???????
                        FontAwesomeIcons.moneyBillWave,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.045,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (data) {
                        //โค้ดคำสั่งใดก็ตามมีผลต่อการแสดงผลบนหน้าจอ ให้เขียนภายใต้
                        //คำสั่ง setState
                        setState(() {
                          tipCheck = data!;
                          if (data == false) {
                            tipCtrl.text = '';
                          }
                        });
                      },
                      value: tipCheck,
                      side: BorderSide(
                        color: Color.fromARGB(255, 246, 79, 95),
                      ),
                      checkColor: Colors.yellow,
                      activeColor: Color.fromARGB(255, 246, 79, 95),
                    ),
                    Text(
                      'เงินทิป (บาท)',
                      style: GoogleFonts.itim(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    enabled: tipCheck,
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 147, 145, 145),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        //Icons.???????
                        FontAwesomeIcons.moneyBillWheat,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        //validate (ตรวจสอบ) หน้าจอ เมื่อ validate เรียบร้อยแล้วจะเปิดไปหน้าจอ ShowMoneyShareUI
                        if (moneyCtrl.text.isEmpty == true) {
                          //แปลว่ายังไม่ได้ป้อน แสดง dialog เตือน
                          _showWarningDialog(context, 'ป้อนจำนวนเงินด้วย...');
                        } else if (personCtrl.text.isEmpty == true) {
                          //แปลว่ายังไม่ได้ป้อน แสดง dialog เตือน
                          _showWarningDialog(context, 'ป้อนจำนวนคนด้วย...');
                        } else if (tipCheck == true) {
                          if (tipCtrl.text.isEmpty == true) {
                            //แปลว่ายังไม่ได้ป้อน แสดง dialog เตือน
                            _showWarningDialog(context, 'ป้อนจำนวนเงินทิปด้วย...');
                          } else {
                            //เปิดหน้าจอพร้อมส่ง เงิน คน ทิป ที่ป้อน
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: moneyCtrl.text,
                                  person: personCtrl.text,
                                  tip: tipCtrl.text,
                                ),
                              ),
                            );
                          }
                        } else {
                          //เปิดหน้าจอพร้อมส่ง เงิน คน ที่ป้อน และทิปเป็น 0
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowMoneyShareUI(
                                money: moneyCtrl.text,
                                person: personCtrl.text,
                                tip: "0",
                              ),
                            ),
                          );
                        }

                        //โค้ดคำสั่งเปิดหน้าจออื่นๆ (แบบย้อนกลับมาหน้าจอที่เปิดไปได้)
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ShowMoneyShareUI(),
                        //   ),
                        // );
                      },
                      icon: Icon(
                        Icons.calculate,
                      ),
                      label: Text(
                        'คำนวณ',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel,
                      ),
                      label: Text(
                        'ยกเลิก',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.width * 0.14,
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
