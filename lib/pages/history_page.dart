import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          'Historique',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabs(),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAllTransactions(),
                _buildCompletedTransactions(),
                _buildPendingTransactions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.all(16),
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
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        tabs: const [
          Tab(text: "Tout"),
          Tab(text: "Terminés"),
          Tab(text: "En attente"),
        ],
      ),
    );
  }

  Widget _buildAllTransactions() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildTransactionItem(
          icon: Icons.shopping_bag,
          title: "Achat Puma - Chaussures Sport",
          subtitle: "Boutique Puma, Abidjan",
          amount: "160,500 FCFA",
          date: "15 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Vêtements",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.local_drink,
          title: "Paiement Pepsi - Boissons",
          subtitle: "Supermarché Carrefour",
          amount: "80,000 FCFA",
          date: "12 Mai 2024",
          status: "En attente",
          statusColor: Colors.orange,
          category: "Alimentation",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.sports_soccer,
          title: "Achat Nike - Équipement Sport",
          subtitle: "Boutique Nike, Cocody",
          amount: "120,000 FCFA",
          date: "10 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Sport",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.computer,
          title: "Achat Apple - iPhone 15",
          subtitle: "Apple Store, Plateau",
          amount: "1,250,000 FCFA",
          date: "8 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Électronique",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.phone_android,
          title: "Achat Samsung - Galaxy S24",
          subtitle: "Boutique Samsung, Marcory",
          amount: "450,000 FCFA",
          date: "5 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Électronique",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.local_gas_station,
          title: "Paiement Essence - Station Total",
          subtitle: "Station Total, Treichville",
          amount: "25,000 FCFA",
          date: "3 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Transport",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.restaurant,
          title: "Restaurant - Le Bistrot",
          subtitle: "Restaurant Le Bistrot, Cocody",
          amount: "45,000 FCFA",
          date: "1 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Restaurant",
        ),
      ],
    );
  }

  Widget _buildCompletedTransactions() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildTransactionItem(
          icon: Icons.shopping_bag,
          title: "Achat Puma - Chaussures Sport",
          subtitle: "Boutique Puma, Abidjan",
          amount: "160,500 FCFA",
          date: "15 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Vêtements",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.sports_soccer,
          title: "Achat Nike - Équipement Sport",
          subtitle: "Boutique Nike, Cocody",
          amount: "120,000 FCFA",
          date: "10 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Sport",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.computer,
          title: "Achat Apple - iPhone 15",
          subtitle: "Apple Store, Plateau",
          amount: "1,250,000 FCFA",
          date: "8 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Électronique",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.phone_android,
          title: "Achat Samsung - Galaxy S24",
          subtitle: "Boutique Samsung, Marcory",
          amount: "450,000 FCFA",
          date: "5 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Électronique",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.local_gas_station,
          title: "Paiement Essence - Station Total",
          subtitle: "Station Total, Treichville",
          amount: "25,000 FCFA",
          date: "3 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Transport",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.restaurant,
          title: "Restaurant - Le Bistrot",
          subtitle: "Restaurant Le Bistrot, Cocody",
          amount: "45,000 FCFA",
          date: "1 Mai 2024",
          status: "Terminé",
          statusColor: Colors.green,
          category: "Restaurant",
        ),
      ],
    );
  }

  Widget _buildPendingTransactions() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildTransactionItem(
          icon: Icons.local_drink,
          title: "Paiement Pepsi - Boissons",
          subtitle: "Supermarché Carrefour",
          amount: "80,000 FCFA",
          date: "12 Mai 2024",
          status: "En attente",
          statusColor: Colors.orange,
          category: "Alimentation",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.shopping_cart,
          title: "Commande en ligne - Amazon",
          subtitle: "Amazon.com",
          amount: "350,000 FCFA",
          date: "20 Mai 2024",
          status: "En cours",
          statusColor: Colors.blue,
          category: "E-commerce",
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          icon: Icons.flight,
          title: "Billet d'avion - Air France",
          subtitle: "Air France, Aéroport FHB",
          amount: "850,000 FCFA",
          date: "25 Mai 2024",
          status: "En attente",
          statusColor: Colors.orange,
          category: "Transport",
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required String date,
    required String status,
    required Color statusColor,
    required String category,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
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
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
