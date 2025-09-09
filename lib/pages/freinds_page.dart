import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostModel {
  final String text;
  final String? imageUrl; // optional

  PostModel({required this.text, this.imageUrl});
}

/// Provider for posts
final postsProvider = StateProvider<List<PostModel>>((ref) => []);

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  final TextEditingController controller = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitPost() {
    final text = controller.text.trim();
    if (text.isNotEmpty || _selectedImage != null) {
      final newPost =
          PostModel(text: text, imageUrl: _selectedImage?.path);

      ref.read(postsProvider.notifier).state = [
        newPost,
        ...ref.read(postsProvider),
      ];

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Post",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: _submitPost,
            child: const Text(
              "Post",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "What is happening?!",
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10),

            // Show selected image preview
            if (_selectedImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _selectedImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const Spacer(),

            // Add image button
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                icon: const Icon(Icons.image, color: Colors.blue),
                onPressed: _pickImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
