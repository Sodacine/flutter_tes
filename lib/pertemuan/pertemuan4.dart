import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastDialogPage extends StatefulWidget {
  const ToastDialogPage({super.key});

  @override
  State<ToastDialogPage> createState() => _ToastDialogPageState();
}

class _ToastDialogPageState extends State<ToastDialogPage> {
  void showToast(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void showConfirmDialog({
    required String title,
    required String content,
    required Color color,
    required String successMessage,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            onPressed: () {
              Navigator.pop(context);
              showToast(successMessage, color);
            },
            child: const Text("Ya"),
          ),
        ],
      ),
    );
  }

  Widget customButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Pertemuan 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            customButton(
              text: "Submit",
              color: Colors.green,
              icon: Icons.check,
              onTap: () {
                showConfirmDialog(
                  title: "Konfirmasi Submit",
                  content: "Apakah kamu ingin menambahkan data?",
                  color: Colors.green,
                  successMessage: "Berhasil menambahkan data!",
                );
              },
            ),

            const SizedBox(height: 20),

            customButton(
              text: "Delete",
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                showConfirmDialog(
                  title: "Konfirmasi Delete",
                  content: "Apakah kamu ingin menghapus data?",
                  color: Colors.red,
                  successMessage: "Berhasil menghapus data!",
                );
              },
            ),

            const SizedBox(height: 20),

            customButton(
              text: "Show Dialog",
              color: Colors.grey,
              icon: Icons.info,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Alert Dialog"),
                    content: const Text("Ini contoh AlertDialog"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Tutup"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}