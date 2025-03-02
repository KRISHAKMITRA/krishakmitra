import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PublishPostPage extends StatefulWidget {
  @override
  _PublishPostPageState createState() => _PublishPostPageState();
}

class _PublishPostPageState extends State<PublishPostPage> {
  List<Widget> contentList = [];
  final TextEditingController titleController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _showAddOptions(BuildContext context, TapDownDetails details) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        details.globalPosition & Size(40, 40), // Position where tapped
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(child: Text('H2'), onTap: () => _addTextField()),
        PopupMenuItem(child: Text('H1'), onTap: () => _addTextField()),
        PopupMenuItem(child: Text('H3'), onTap: () => _addTextField()),
        PopupMenuItem(child: Text('Image'), onTap: () => _addImage()),
      ],
    );
  }

  void _addTextField() {
    setState(() {
      contentList.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            maxLines: null,
            decoration: InputDecoration(hintText: 'Enter Here...', border: InputBorder.none),
          ),
        ),
      );
    });
  }

  Future<void> _addImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        contentList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.file(File(pickedFile.path), width: double.infinity, height: 200, fit: BoxFit.cover),
          ),
        );
      });
    }
  }

  void _publishPost() {
    print("Publishing Post...");
    // Here you will integrate the backend API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Post"), actions: [IconButton(icon: Icon(Icons.publish), onPressed: _publishPost)]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: TextFormField(controller: titleController, maxLines: null, decoration: InputDecoration(hintText: "Enter title...")),
            ),
            SizedBox(height: 10),
            GestureDetector(onTapDown: (details) => _showAddOptions(context, details), child: Text("Add Content")),
            Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 600), child: Expanded(child: Column(children: contentList)))),
          ],
        ),
      ),
    );
  }
}
