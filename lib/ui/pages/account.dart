import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabichizu/data/constants/hive.dart';
import 'package:tabichizu/data/model/hive/user/user.dart';
import 'package:tabichizu/ui/common/ad_banner.dart';
import 'package:tabichizu/ui/common/form/custom_form.dart';
import 'package:tabichizu/ui/common/form/custom_form_text_field.dart';
import 'package:tabichizu/ui/common/table/custom_cell.dart';
import 'package:tabichizu/ui/common/table/custom_table.dart';
import 'package:tabichizu/ui/custom_color_picker.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingController _textController = TextEditingController();

  late Box<User> userBox;
  File? image;

  void changeImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    final path = pickedFile.path;
    final user = userBox.get("user");
    userBox.put(
      "user",
      User(
        userName: user?.userName,
        image: pickedFile.path,
        theme: user?.theme,
      ),
    );
    setState(() {
      image = File(path);
    });
  }

  void changeUserName(String? value) async {
    final user = userBox.get("user");
    userBox.put(
        "user", User(userName: value, image: user?.image, theme: user?.theme));
    _textController.text = userBox.get("user")!.userName!;
  }

  void changeColor(Color color) {
    final user = userBox.get("user");
    userBox.put("user",
        User(userName: user?.userName, image: user?.image, theme: color.value));
  }

  @override
  Widget build(BuildContext context) {
    userBox = Hive.box(userBoxName);
    image = userBox.get("user") != null && userBox.get("user")?.image != null
        ? File(userBox.get("user")!.image!)
        : null;
    _textController.text = userBox.get("user")?.userName ?? "UserName";

    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(top: 64),
          ),
          // const AdBannerWidget(
          //   size: AdSize.largeBanner,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: GestureDetector(
              onTap: changeImage,
              child: image == null
                  ? const Icon(
                      Icons.account_circle,
                      size: 144,
                    )
                  : Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(File(image!.path)),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
            ),
          ),
          SizedBox(
            width: 256,
            child: CustomForm(
              child: CustomFormTextField(
                name: "userName",
                fontSize: 44,
                hasBorder: false,
                textAlign: TextAlign.center,
                controller: _textController,
                onChanged: changeUserName,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: CustomTable(
                    children: [
                      TableRow(
                        children: [
                          const CustomCell(
                            id: "theme",
                            text: "テーマ",
                            textAlign: TextAlign.center,
                          ),
                          ValueListenableBuilder(
                            valueListenable: userBox.listenable(),
                            builder: (context, box, _) {
                              int theme = box.get("user")?.theme ??
                                  const Color(0xff000000).value;
                              return CustomCell(
                                id: "colorCode",
                                text: Color(theme).value.toRadixString(16),
                                textAlign: TextAlign.right,
                                onTap: (_, __) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomColorPicker(
                                        context: context,
                                        theme: theme,
                                        changeColor: changeColor,
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
