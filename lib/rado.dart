import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: const Text('PPM Sesi 2 - siprianus rado sangkekk (20240020223)'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              PromoBanner(),
              SizedBox(height: 16),
              ProfileCard(),
              SizedBox(height: 16),
              ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
 
// Banner promo (Stack + Positioned)
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.teal,
      child: const Stack(
        children: [
          Positioned(
            left: 16,
            top: 30,
            child: Text(
              'PROMO DISKON 20%',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Icon(Icons.local_offer, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }
}
 
// Kartu profil (StatelessWidget)
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(radius: 32, child: Icon(Icons.person, size: 40)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Siprianus Rado Sangkekk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('NIM: 20240020223'),
                const Text('Teknik Informatika / Kelas g'),
                Row(
                  children: List.generate(5, (i) => const Icon(Icons.star, color: Colors.amber)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 
// Kartu produk (StatefulWidget)
class ProductCard extends StatefulWidget {
  const ProductCard({super.key});
 
  @override
  State<ProductCard> createState() => _ProductCardState();
}
 
class _ProductCardState extends State<ProductCard> {
  final int harga = 250000;
  bool favorite = false;
  int like = 10;
  int jumlah = 1;
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.teal.shade50,
              child: const Icon(Icons.shopping_bag, size: 64, color: Colors.teal),
            ),
            const SizedBox(height: 12),
            const Text('Sepatu Sneakers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Rp $harga'),
            const Text('Kategori: Fashion'),
            const SizedBox(height: 8),
 
            // Favorite
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    favorite ? Icons.favorite : Icons.favorite_border,
                    color: favorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                      like += favorite ? 1 : -1;
                    });
                  },
                ),
                Text('$like Like'),
              ],
            ),
 
            // Jumlah - dan +
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (jumlah > 1) setState(() => jumlah--);
                  },
                ),
                Text('$jumlah', style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => jumlah++),
                ),
              ],
            ),
            Text('Total: Rp ${harga * jumlah}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
 
            // Tambah ke keranjang
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$jumlah produk ditambahkan ke keranjang')),
                  );
                },
                child: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}