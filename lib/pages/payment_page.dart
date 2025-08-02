import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Paiements',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              _showNotificationDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildPaymentCard(),
          const SizedBox(height: 16),
          _buildTabs(),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildUpcomingPayments(), _buildAllOrders()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFFF4ECFA), Colors.deepPurple.shade50],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.payment, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                "Échéances à venir",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Mai",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "642,000 FCFA",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Text(
            "Total dû: 753,000 FCFA",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handlePayNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      "Payer Maintenant",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDueInfo("327,000 FCFA", "Dû dans 15 jours", Colors.orange),
              _buildDueInfo("316,000 FCFA", "Dû dans 30 jours", Colors.blue),
              _buildDueInfo("11,000 FCFA", "Dû dans 60 jours", Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDueInfo(String amount, String period, Color color) {
    return Column(
      children: [
        Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: color,
          ),
        ),
        Text(period, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.deepPurple,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        tabs: const [
          Tab(text: "À venir"),
          Tab(text: "Toutes les commandes"),
        ],
      ),
    );
  }

  Widget _buildUpcomingPayments() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildPaymentItem(
          icon: Icons.shopping_bag,
          label: 'Puma',
          amount: '160,500 FCFA',
          due: 'Dû dans 7 jours',
          paymentStatus: '2ème paiement',
          statusColor: Colors.orange,
        ),
        const SizedBox(height: 12),
        _buildPaymentItem(
          icon: Icons.local_drink,
          label: 'Pepsi',
          amount: '80,000 FCFA',
          due: 'Dû dans 12 jours',
          paymentStatus: '1er paiement',
          statusColor: Colors.blue,
        ),
        const SizedBox(height: 12),
        _buildPaymentItem(
          icon: Icons.sports_soccer,
          label: 'Nike',
          amount: '120,000 FCFA',
          due: 'Dû dans 5 jours',
          paymentStatus: '3ème paiement',
          statusColor: Colors.red,
        ),
        const SizedBox(height: 12),
        _buildPaymentItem(
          icon: Icons.computer,
          label: 'Apple',
          amount: '299,500 FCFA',
          due: 'Dû dans 20 jours',
          paymentStatus: '1er paiement',
          statusColor: Colors.green,
        ),
      ],
    );
  }

  Widget _buildAllOrders() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildPaymentItem(
          icon: Icons.shopping_bag,
          label: 'Puma',
          amount: '160,500 FCFA',
          due: 'Payé le 15 mai',
          paymentStatus: 'Terminé',
          statusColor: Colors.green,
          isCompleted: true,
        ),
        const SizedBox(height: 12),
        _buildPaymentItem(
          icon: Icons.local_drink,
          label: 'Pepsi',
          amount: '80,000 FCFA',
          due: 'Dû dans 12 jours',
          paymentStatus: '1er paiement',
          statusColor: Colors.blue,
        ),
        const SizedBox(height: 12),
        _buildPaymentItem(
          icon: Icons.sports_soccer,
          label: 'Nike',
          amount: '120,000 FCFA',
          due: 'Payé le 10 mai',
          paymentStatus: 'Terminé',
          statusColor: Colors.green,
          isCompleted: true,
        ),
        const SizedBox(height: 12),
        _buildPaymentItem(
          icon: Icons.computer,
          label: 'Apple',
          amount: '299,500 FCFA',
          due: 'Dû dans 20 jours',
          paymentStatus: '1er paiement',
          statusColor: Colors.green,
        ),
        const SizedBox(height: 12),
        _buildPaymentItem(
          icon: Icons.phone_android,
          label: 'Samsung',
          amount: '450,000 FCFA',
          due: 'Payé le 5 mai',
          paymentStatus: 'Terminé',
          statusColor: Colors.green,
          isCompleted: true,
        ),
      ],
    );
  }

  Widget _buildPaymentItem({
    required IconData icon,
    required String label,
    required String amount,
    required String due,
    required String paymentStatus,
    required Color statusColor,
    bool isCompleted = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.deepPurple, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  due,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    paymentStatus,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              if (!isCompleted)
                SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () => _handleIndividualPayment(label, amount),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: const Text(
                      "Payer",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Payé",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _handlePayNow() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate payment processing
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      _showPaymentSuccessDialog();
    }
  }

  void _handleIndividualPayment(String label, String amount) {
    _showPaymentConfirmationDialog(label, amount);
  }

  void _showPaymentConfirmationDialog(String label, String amount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Confirmer le Paiement',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Êtes-vous sûr de vouloir payer $amount pour $label ?',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showPaymentSuccessDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }

  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check_circle, color: Colors.green, size: 48),
              ),
              const SizedBox(height: 16),
              const Text(
                'Paiement Réussi!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Votre paiement a été traité avec succès.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Notifications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Vous avez 3 nouveaux rappels de paiement.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ignorer'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Voir Tout'),
            ),
          ],
        );
      },
    );
  }
}
