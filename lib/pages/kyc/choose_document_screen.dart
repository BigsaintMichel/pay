import 'package:flutter/material.dart';
import 'scan_document_screen.dart';

class ChooseDocumentScreen extends StatelessWidget {
  const ChooseDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bienvenue', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // Supprime le bouton retour
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 0.3,
              backgroundColor: Colors.grey[300],
              color: Colors.purple,
            ),
            const SizedBox(height: 30),

            Text(
              'Vérification d\'identité',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              'Pour votre sécurité, nous devons vérifier votre identité. Veuillez sélectionner le type de document que vous souhaitez scanner.',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 40),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDocumentCard(
                    context,
                    'Carte d\'Identité',
                    Icons.credit_card,
                    Colors.blue,
                    'Carte d\'identité nationale',
                  ),
                  _buildDocumentCard(
                    context,
                    'Passeport',
                    Icons.flight_takeoff,
                    Colors.green,
                    'Passeport en cours de validité',
                  ),
                  _buildDocumentCard(
                    context,
                    'Permis de Conduire',
                    Icons.drive_eta,
                    Colors.orange,
                    'Permis de conduire national',
                  ),
                  _buildDocumentCard(
                    context,
                    'Carte Vitale',
                    Icons.health_and_safety,
                    Colors.red,
                    'Carte vitale ou équivalent',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String description,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanDocumentScreen(documentType: title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
