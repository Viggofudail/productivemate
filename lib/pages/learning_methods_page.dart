import 'package:flutter/material.dart';

class LearningMethodsPage extends StatefulWidget {
  const LearningMethodsPage({super.key});

  @override
  _LearningMethodsPageState createState() => _LearningMethodsPageState();
}

class _LearningMethodsPageState extends State<LearningMethodsPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> learningMethods = [
    {
      "title": "Metode Feynman",
      "description":
          "Metode Feynman adalah teknik yang digunakan untuk memahami konsep-konsep kompleks dengan cara menyederhanakannya dan menjelaskannya seolah-olah Anda sedang mengajarkannya kepada orang lain. Jika Anda tidak dapat menjelaskan sesuatu dengan jelas, maka Anda mungkin belum memahami materi tersebut sepenuhnya. Teknik ini membantu mengidentifikasi kekurangan dalam pengetahuan dan memberikan pendekatan yang lebih intuitif untuk belajar.\n\nManfaat:\n- Memperdalam Pemahaman\n- Menemukan Kekurangan Pengetahuan\n- Meningkatkan Daya Ingat\n- Meningkatkan Kepercayaan Diri"
    },
    {
      "title": "Mind Mapping",
      "description":
          "Mind mapping adalah teknik visual yang digunakan untuk mengorganisir ide dan informasi secara lebih terstruktur. Teknik ini menghubungkan informasi dari berbagai sumber dan menampilkannya dalam bentuk diagram yang memudahkan pemahaman. Mind mapping membantu untuk melihat gambaran besar dari suatu topik dan menyusun ide-ide secara sistematis.\n\nManfaat:\n- Mempermudah Pengorganisasian Ide\n- Meningkatkan Kreativitas\n- Mempercepat Pemahaman"
    },
    {
      "title": "Spaced Repetition",
      "description":
          "Spaced repetition adalah teknik pembelajaran yang mengulang materi dengan interval waktu tertentu. Teknik ini didasarkan pada penelitian yang menunjukkan bahwa pengulangan informasi pada interval yang semakin panjang akan meningkatkan daya ingat dan mencegah lupa.\n\nManfaat:\n- Meningkatkan Retensi\n- Mencegah Lupa\n- Efisien dalam Waktu"
    },
    {
      "title": "Metode PQ4R",
      "description":
          "Metode PQ4R adalah teknik membaca yang mencakup langkah-langkah: Preview, Question, Read, Reflect, Recite, Review. Teknik ini membantu pembaca untuk lebih memahami dan mengingat bacaan dengan mendalam.\n\nManfaat:\n- Memperdalam Pemahaman Bacaan\n- Meningkatkan Retensi\n- Menajamkan Keterampilan Membaca"
    },
    {
      "title": "Metode SQ3R",
      "description":
          "Metode SQ3R adalah metode membaca yang mencakup langkah-langkah Survey, Question, Read, Recite, dan Review. Tujuannya adalah untuk memahami dan mengingat informasi secara lebih efisien, dengan memfokuskan pembaca pada hal-hal yang paling penting.\n\nManfaat:\n- Efektivitas Membaca\n- Memperbaiki Pengingatan\n- Meningkatkan Kecepatan Membaca"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Metode Belajar",
          style: TextStyle(
            color: Colors.orange[800],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24), // Spacing for header
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: learningMethods.length,
              physics: const BouncingScrollPhysics(), // Enable swipe
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Center(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque, // Allow swipes to pass through
                      onHorizontalDragUpdate: (details) {
                        // Enable swipe gestures for PageView
                        _pageController.position.moveTo(
                          _pageController.position.pixels - details.delta.dx,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF9754), // Bright orange color
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.lightbulb, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      learningMethods[index]['title']!,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                learningMethods[index]['description']!,
                                style: const TextStyle(
                                  fontSize: 16, // Slightly smaller font for readability
                                  color: Colors.black87,
                                  height: 1.5, // Better line height
                                ),
                                textAlign: TextAlign.justify, // Justified alignment for cleaner look
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              learningMethods.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: _currentIndex == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.orange[800]
                      : Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LearningMethodsPage(),
  ));
}
