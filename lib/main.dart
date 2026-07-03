import 'package:flutter/material.dart';

void main() => runApp(const SmartClinicApp());

class SmartClinicApp extends StatelessWidget {
  const SmartClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Clinic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

// ============ SPLASH SCREEN ============
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B2A), Color(0xFF1A73E8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A73E8), Color(0xFF00BFA5)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.local_hospital,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Smart Clinic',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'العيادة الذكية',
                style: TextStyle(fontSize: 24, color: Color(0xFF64B5F6)),
              ),
              const SizedBox(height: 8),
              const Text(
                '& Med-Podcast 🎙️',
                style: TextStyle(fontSize: 16, color: Color(0xFF00BFA5)),
              ),
              const SizedBox(height: 50),
              const CircularProgressIndicator(
                color: Color(0xFF00BFA5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============ HOME PAGE ============
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1A73E8), Color(0xFF00BFA5)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.local_hospital,
                        color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('مرحباً يا دكتور 👋',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text('العيادة الذكية 🏥',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: _stat('🎙️', 'البودكاستات', '0',
                          [const Color(0xFF7C4DFF), const Color(0xFFE040FB)])),
                  const SizedBox(width: 12),
                  Expanded(
                      child: _stat('🏆', 'التحديات', '0',
                          [const Color(0xFFFF6D00), const Color(0xFFFFAB00)])),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const UploadPage())),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1A73E8), Color(0xFF00BFA5)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.upload_file,
                            color: Colors.white, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('ارفع ملفك الآن! 📄',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 4),
                            Text('PDF، سلايدات، أو صور',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white70)),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text('🎙️ آخر البودكاستات',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text('🎧', style: TextStyle(fontSize: 60)),
                    const SizedBox(height: 16),
                    const Text('لسه ما عندك بودكاستات',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('ارفع أول ملف وخلّي AI يحوله بودكاست ممتع! 🚀',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const UploadPage())),
        backgroundColor: const Color(0xFF00BFA5),
        icon: const Icon(Icons.add),
        label: const Text('رفع ملف جديد'),
      ),
    );
  }

  Widget _stat(String emoji, String label, String value, List<Color> colors) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 12),
          Text(value,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(label,
              style: const TextStyle(fontSize: 13, color: Colors.white70)),
        ],
      ),
    );
  }
}

// ============ UPLOAD PAGE ============
class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('رفع ملف جديد 📄'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('اختر نوع الملف 📋',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _fileType('📕', 'PDF', Colors.red),
                _fileType('📊', 'سلايدات', Colors.orange),
                _fileType('🖼️', 'صور', Colors.blue),
                _fileType('📝', 'مستند', Colors.green),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PodcastPage())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BFA5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('🚀 ابدأ التحويل بالذكاء الاصطناعي',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fileType(String emoji, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 8),
          Text(label,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}

// ============ PODCAST PAGE ============
class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B2A), Color(0xFF1A237E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text('🎙️ البودكاست',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7C4DFF), Color(0xFFE040FB)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.5),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: const Icon(Icons.mic, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text('Acute Angle-Closure Glaucoma',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Ophthalmology',
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 30),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF7C4DFF), Color(0xFFE040FB)],
                        ),
                      ),
                      child: const Icon(Icons.play_arrow,
                          color: Colors.white, size: 40),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const QuizPage())),
                      icon: const Icon(Icons.emoji_events),
                      label: const Text('🏆 تحدي الأبطال'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6D00),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============ QUIZ PAGE ============
class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('🏆 تحدي الأبطال',
            style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'ما هو العلاج الأول للجلوكوما الحادة مغلقة الزاوية؟',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            _option('A', 'قطرة أتروبين'),
            _option('B', 'دموع صناعية'),
            _option('C', 'Pilocarpine + Timolol ✅'),
            _option('D', 'قطرة ستيرويد فقط'),
          ],
        ),
      ),
    );
  }

  Widget _option(String letter, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
            child: Center(
              child: Text(letter,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
