import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'facial_verification_screen.dart';

class ScanDocumentScreen extends StatefulWidget {
  final String documentType;

  const ScanDocumentScreen({super.key, required this.documentType});

  @override
  _ScanDocumentScreenState createState() => _ScanDocumentScreenState();
}

class _ScanDocumentScreenState extends State<ScanDocumentScreen> {
  XFile? frontImage;
  XFile? backImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isFront) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isFront) {
          frontImage = image;
        } else {
          backImage = image;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'Scanner ${widget.documentType}',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 0.65,
              backgroundColor: Colors.grey[300],
              color: Colors.purple,
            ),
            const SizedBox(height: 30),

            /// FRONT
            Text(
              'Télécharger le recto de votre ${widget.documentType.toLowerCase()}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            _buildUploadBox(isFront: true, image: frontImage),

            const SizedBox(height: 40),

            /// BACK
            Text(
              'Télécharger le verso de votre ${widget.documentType.toLowerCase()}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            _buildUploadBox(isFront: false, image: backImage),

            Spacer(),

            /// Continue Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: (frontImage != null && backImage != null)
                    ? () {
                        // Handle continue action
                        _showSuccessDialog();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continuer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadBox({required bool isFront, XFile? image}) {
    return GestureDetector(
      onTap: () => _pickImage(isFront),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(File(image.path), fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isFront ? 'Télécharger le recto' : 'Télécharger le verso',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Assurez-vous que tous les détails sont visibles et clairs',
                    style: TextStyle(color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Télécharger',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Empêche la fermeture en tapant à l'extérieur
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 30),
              SizedBox(width: 10),
              Text('Document Scanné'),
            ],
          ),
          content: Text(
            'Votre ${widget.documentType.toLowerCase()} a été scanné avec succès ! Passons maintenant à la vérification faciale.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le dialog
                // Redirige vers la vérification faciale
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FacialVerificationScreen(
                      documentType: widget.documentType,
                    ),
                  ),
                );
              },
              child: Text('Continuer', style: TextStyle(color: Colors.purple)),
            ),
          ],
        );
      },
    );
  }
}
