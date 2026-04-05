import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const DermalyzeApp());
}

class DermalyzeApp extends StatelessWidget {
  const DermalyzeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6C63FF),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  bool _isAnalyzing = false;
  bool _showResult = false;

  // Fungsi untuk mensimulasikan proses analisis kulit (State Management Sederhana)
  void _startAnalysis() async {
    setState(() => _isAnalyzing = true);
    await Future.delayed(const Duration(seconds: 3)); // Simulasi loading AI
    setState(() {
      _isAnalyzing = false;
      _showResult = true;
    });
  }

  // Fungsi navigasi halaman berdasarkan index BottomNavigationBar
  Widget _getBody() {
    switch (_currentIndex) {
      case 0: // Halaman Home (Scanning atau Hasil)
        return _showResult
            ? const AnalysisResultDashboard()
            : _buildScanningMode();
      case 1: // Halaman Pencarian
        return _buildSearchPage();
      case 2: // Halaman Favorit
        return _buildFavoritePage();
      case 3: // Halaman Profil
        return _buildProfilePage();
      default:
        return _buildScanningMode();
    }
  }

  Widget _buildScanningMode() {
    return Stack(
      children: [
        // Background Camera Placeholder (Image)
        // Widget Image: Menggunakan NetworkImage untuk mensimulasikan feed kamera
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Image.network(
            'https://images.pexels.com/photos/3985330/pexels-photo-3985330.jpeg?auto=compress&cs=tinysrgb&w=1260',
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(.8),
          ),
        ),

        // Premium Medical Overlay
        // Widget Container & Stack: Membuat bingkai pemindaian wajah yang estetik
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 280,
                height: 380,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              // Corner brackets for scan effect
              ...List.generate(4, (index) {
                return Positioned(
                  top: index < 2 ? 0 : null,
                  bottom: index >= 2 ? 0 : null,
                  left: index % 2 == 0 ? 0 : null,
                  right: index % 2 != 0 ? 0 : null,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        top: index < 2
                            ? const BorderSide(
                                color: Color(0xFF6C63FF),
                                width: 4,
                              )
                            : BorderSide.none,
                        bottom: index >= 2
                            ? const BorderSide(
                                color: Color(0xFF6C63FF),
                                width: 4,
                              )
                            : BorderSide.none,
                        left: index % 2 == 0
                            ? const BorderSide(
                                color: Color(0xFF6C63FF),
                                width: 4,
                              )
                            : BorderSide.none,
                        right: index % 2 != 0
                            ? const BorderSide(
                                color: Color(0xFF6C63FF),
                                width: 4,
                              )
                            : BorderSide.none,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: index == 0
                            ? const Radius.circular(40)
                            : Radius.zero,
                        topRight: index == 1
                            ? const Radius.circular(40)
                            : Radius.zero,
                        bottomLeft: index == 2
                            ? const Radius.circular(40)
                            : Radius.zero,
                        bottomRight: index == 3
                            ? const Radius.circular(40)
                            : Radius.zero,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),

        // Text Instruction
        // Widget Text: Instruksi pemindaian dengan font semi-bold
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                "Dermalyze AI",
                style: TextStyle(
                  color: Color(0xFF6C63FF),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Scan Your Face for Analysis",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Shutter Button
        // Widget CircleAvatar: Tombol shutter estetik
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: _isAnalyzing ? null : _startAnalysis,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: _isAnalyzing
                      ? const CircularProgressIndicator(
                          color: Color(0xFF6C63FF),
                        )
                      : const Icon(
                          Icons.camera_alt,
                          color: Color(0xFF6C63FF),
                          size: 30,
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- HALAMAN PENCARIAN (SEARCH) ---
  // Widget: Menampilkan kolom pencarian dan trending skincare
  Widget _buildSearchPage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          // Widget Text: Judul halaman pencarian
          const Text(
            "Search Products",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C63FF),
            ),
          ),
          const SizedBox(height: 20),
          // Widget Container: Wrapper untuk TextField agar memiliki shadow & rounded corner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Cari Skincare atau Bahan Aktif...",
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Color(0xFF6C63FF)),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Trending Searches",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          // Widget Wrap: Menampilkan daftar pencarian populer dalam bentuk chip
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                [
                      "Retinol",
                      "Niacinamide",
                      "Sunscreen",
                      "Moisturizer",
                      "Vitamin C",
                    ]
                    .map(
                      (tag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Color(0xFF6C63FF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  // --- HALAMAN FAVORIT (FAVORITE) ---
  // Widget: Menampilkan daftar produk yang disukai (saat ini kosong)
  Widget _buildFavoritePage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            "Your Favorites",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C63FF),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                // Widget Icon: Representasi visual untuk data kosong
                Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
                const SizedBox(height: 20),
                const Text(
                  "Belum ada produk favorit.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Simpan produk yang Anda sukai di sini.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- HALAMAN PROFIL (PROFILE) ---
  // Widget: Menampilkan informasi user dan menu pengaturan
  Widget _buildProfilePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 80),
          // Widget CircleAvatar & Image: Foto profil user
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/3762410/pexels-photo-3762410.jpeg?auto=compress&cs=tinysrgb&w=200',
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Widget Text: Nama dan detail instansi user
          const Text(
            "Aisyah Rahmi Nadjib",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Mahasiswi Teknologi Kedokteran ITS",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildProfileItem(Icons.person_outline, "Edit Profile"),
                _buildProfileItem(Icons.history, "Scan History"),
                _buildProfileItem(Icons.settings_outlined, "Settings"),
                _buildProfileItem(Icons.help_outline, "Help Center"),
                const Divider(),
                _buildProfileItem(
                  Icons.logout,
                  "Logout",
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Komponen item list untuk menu profil
  Widget _buildProfileItem(
    IconData icon,
    String title, {
    Color color = Colors.black,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color == Colors.redAccent ? color : const Color(0xFF6C63FF),
      ),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      // Widget BottomNavigationBar: Navigasi utama aplikasi dengan desain minimalis
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF6C63FF),
          unselectedItemColor: Colors.grey[400],
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class AnalysisResultDashboard extends StatelessWidget {
  const AnalysisResultDashboard({super.key});

  // Fungsi untuk membuka link ke Female Daily
  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 80),

          // --- BAGIAN INDIKATOR KESEHATAN (GRIDVIEW) ---
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Skin Health Indicators',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          _buildGrid(),

          // --- BAGIAN REKOMENDASI BAHAN AKTIF (NEW) ---
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 35, 25, 15),
            child: Text(
              'Recommended Active Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildActiveIngredients(),

          // --- BAGIAN REKOMENDASI PRODUK (LISTVIEW) ---
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 35, 25, 15),
            child: Text(
              'Suggested Products for You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildList(),

          const SizedBox(height: 50),
        ],
      ),
    );
  }

  // Widget Image & Stack: Header dengan foto user dan kartu diagnosis premium
  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 380,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            'https://images.pexels.com/photos/3762410/pexels-photo-3762410.jpeg?auto=compress&cs=tinysrgb&w=800',
            fit: BoxFit.cover,
          ),
        ),
        // Glassmorphism-like Card
        Positioned(
          bottom: -60,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ResItem(
                        label: 'Skin Age',
                        val: '23',
                        icon: Icons.cake_outlined,
                      ),
                      _ResItem(
                        label: 'Health Score',
                        val: '86%',
                        icon: Icons.favorite_outline,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ResItem(
                        label: 'Undertone',
                        val: 'Warm',
                        icon: Icons.palette_outlined,
                      ),
                      _ResItem(
                        label: 'Skin Shade',
                        val: 'Beige',
                        icon: Icons.face_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget GridView: Menampilkan 4 parameter kesehatan kulit dengan progress indicator
  Widget _buildGrid() {
    final metrics = [
      {
        'l': 'Dryness',
        'v': 0.15,
        'p': '15%',
        'c': Colors.blue,
        'i': Icons.water_drop_outlined,
      },
      {
        'l': 'Spots',
        'v': 0.08,
        'p': '8%',
        'c': Colors.orange,
        'i': Icons.grain_outlined,
      },
      {
        'l': 'Acne',
        'v': 0.05,
        'p': '5%',
        'c': Colors.redAccent,
        'i': Icons.bug_report_outlined,
      },
      {
        'l': 'Moisture',
        'v': 0.82,
        'p': '82%',
        'c': Colors.green,
        'i': Icons.opacity_outlined,
      },
    ];
    // Widget GridView.builder: Membuat grid 2x2 secara dinamis untuk parameter kesehatan
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.3,
      ),
      itemCount: metrics.length,
      itemBuilder: (ctx, i) => Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  metrics[i]['i'] as IconData,
                  size: 18,
                  color: metrics[i]['c'] as Color,
                ),
                const SizedBox(width: 8),
                Text(
                  metrics[i]['l'] as String,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                // Widget CircularProgressIndicator: Visualisasi persentase kesehatan kulit
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    value: metrics[i]['v'] as double,
                    strokeWidth: 6,
                    color: metrics[i]['c'] as Color,
                    backgroundColor: (metrics[i]['c'] as Color).withOpacity(
                      0.1,
                    ),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                const SizedBox(width: 15),
                // Widget Text: Menampilkan nilai persentase secara eksplisit
                Text(
                  metrics[i]['p'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget: Menampilkan rekomendasi bahan aktif (Premium Detail)
  Widget _buildActiveIngredients() {
    final ingredients = [
      {
        'n': 'Ceramides',
        'd': 'Memperbaiki skin barrier dan menjaga kelembapan.',
        'i': Icons.shield_outlined,
      },
      {
        'n': 'Hyaluronic Acid',
        'd': 'Menghidrasi kulit secara mendalam dan intens.',
        'i': Icons.water_drop_outlined,
      },
      {
        'n': 'Niacinamide',
        'd': 'Mencerahkan dan mengontrol produksi minyak.',
        'i': Icons.auto_awesome_outlined,
      },
    ];

    // Widget ListView: Menampilkan daftar bahan aktif secara horizontal (scrollable)
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: ingredients.length,
        itemBuilder: (ctx, i) => Container(
          width: 200,
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF8E87FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                ingredients[i]['i'] as IconData,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(height: 10),
              // Widget Text: Nama bahan aktif
              Text(
                ingredients[i]['n'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              // Widget Text: Deskripsi singkat manfaat bahan aktif
              Text(
                ingredients[i]['d'] as String,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 11,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget ListView: Daftar produk dengan harga, bahan aktif, dan link Female Daily
  Widget _buildList() {
    final items = [
      {
        'b': 'Skintific',
        'n': '5X Ceramide Barrier Moisture Gel',
        'p': 'Rp 139.000',
        'u':
            'https://reviews.femaledaily.com/products/moisturizer/skintific-5x-ceramide-barrier-repair-moisture-gel',
        'i':
            'https://images.pexels.com/photos/3613388/pexels-photo-3613388.jpeg?auto=compress&cs=tinysrgb&w=200',
        'a': 'Ceramide, Hyaluronic Acid, Centella',
      },
      {
        'b': 'Somethinc',
        'n': 'Hyaluronic B5 Serum',
        'p': 'Rp 115.500',
        'u':
            'https://reviews.femaledaily.com/products/serum-essence-31/somethinc-hyaluronic-b5-serum',
        'i':
            'https://images.pexels.com/photos/8122647/pexels-photo-8122647.jpeg?auto=compress&cs=tinysrgb&w=200',
        'a': 'Vitamin B5, Hyaluronic Acid',
      },
      {
        'b': 'Neutrogena',
        'n': 'Hydro Boost Water Gel',
        'p': 'Rp 229.000',
        'u':
            'https://reviews.femaledaily.com/products/moisturizer/neutrogena-hydro-boost-water-gel',
        'i':
            'https://images.pexels.com/photos/4041391/pexels-photo-4041391.jpeg?auto=compress&cs=tinysrgb&w=200',
        'a': 'Hyaluronic Acid, Olive Extract',
      },
    ];
    // Widget ListView.builder: Menampilkan daftar produk secara vertikal
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 20),
      itemCount: items.length,
      itemBuilder: (ctx, i) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () => _openLink(
            items[i]['u']!,
          ), // Navigasi ke link Female Daily saat diklik
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Widget Image & ClipRRect: Foto produk dengan sudut melengkung
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    items[i]['i']!,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Widget Text: Merk produk
                      Text(
                        items[i]['b']!,
                        style: const TextStyle(
                          color: Color(0xFF6C63FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      // Widget Text: Nama lengkap produk
                      Text(
                        items[i]['n']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Widget Text: Detail kandungan bahan aktif
                      Text(
                        "Kandungan: ${items[i]['a']}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Widget Text: Harga produk (Rp)
                          Text(
                            items[i]['p']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C63FF).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Detail",
                              style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResItem extends StatelessWidget {
  final String label, val;
  final IconData icon;
  const _ResItem({required this.label, required this.val, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF6C63FF).withOpacity(0.6), size: 20),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          val,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
