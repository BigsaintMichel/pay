import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EcommerceHomePage extends StatelessWidget {
  const EcommerceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              const SizedBox(height: 20),
              const _CategoryMenu(),
              const SizedBox(height: 20),
              const _TopBrands(),
              const SizedBox(height: 20),
              const _PriceCompareCard(),
              const SizedBox(height: 100), // Espace pour la navigation
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Votre limite de crédit',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            Row(
              children: const [
                Icon(CupertinoIcons.bell, color: Colors.white),
                SizedBox(width: 12),
                Icon(CupertinoIcons.settings, color: Colors.white),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          '231 000 FCFA',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        const CupertinoSearchTextField(placeholder: 'Rechercher...'),
      ],
    );
  }
}

class _CategoryMenu extends StatelessWidget {
  const _CategoryMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _CategoryIcon(label: 'Boutique', icon: Icons.shopping_bag),
          _CategoryIcon(label: 'En magasin', icon: Icons.store),
          _CategoryIcon(label: 'Récompenses', icon: Icons.card_giftcard),
          _CategoryIcon(label: 'Offres', icon: Icons.local_offer),
        ],
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  const _CategoryIcon({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(icon, color: Colors.purple),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _TopBrands extends StatelessWidget {
  const _TopBrands();

  @override
  Widget build(BuildContext context) {
    final brands = [
      'Nike',
      'Macy\'s',
      'Levi\'s',
      'Adidas',
      'Chanel',
      'Pepsi',
      'Starbucks',
      'Puma',
      'Ferrari',
      'Dell',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Marques',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text('Voir tout', style: TextStyle(color: Colors.purple.shade300)),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100, // Hauteur fixe pour éviter le débordement
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: brands
                .map(
                  (brand) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Text(
                          brand[0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        brand,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _PriceCompareCard extends StatelessWidget {
  const _PriceCompareCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.shopping_bag_outlined, color: Colors.purple),
          SizedBox(width: 12),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: 'Comparer les prix. Payez moins.\n',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Comparez les prix et trouvez la meilleure offre.',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.close, size: 18),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Épargne'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Paiement'),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Plus'),
      ],
    );
  }
}
