//import 'package:carrot_flutter/src/shared/global.dart';
//import 'package:carrot_flutter/src/widget/image_button.dart';
import 'package:carrot_flutter/src/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/feed_controller.dart';

final feedController = Get.put(FeedController());

class FeedCreate extends StatefulWidget {
  const FeedCreate({super.key});

  get model => null;

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  get labelTextStyle => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  get inputDecoration => const InputDecoration(
        border: OutlineInputBorder(),
      );

  int? fileId;

  final ImagePicker picker = ImagePicker();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final String title = _titleController.text;
      final String price = _priceController.text;
      final String content = _contentController.text;

      // 피드 작성 로직
      bool result =
          await feedController.feedCreate(title, content, price, fileId);
      if (result) {
        Get.back();
      }
    }
  }

  void uploadImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    int id = await feedController.upload(image.name, image.path);
    setState(() {
      fileId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 기존 코드
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                children: [
                  // ListView 내용 추가
                  Image.network(
                    "${Global.apiRoot}/api/file/${widget.model.imageId}",
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'asset/logo.png',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      widget.model.title ?? '제목 없음',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      widget.model.content ?? '내용없음',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.model.price.toString()} 원",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 161, 104, 210),
                    ),
                    child: const Text(
                      '연락하기',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
