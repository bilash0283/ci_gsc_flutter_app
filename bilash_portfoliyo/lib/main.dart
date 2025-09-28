import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BilashPortfolio());
}

class BilashPortfolio extends StatelessWidget {
  const BilashPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilash Portfolio',
      debugShowCheckedModeBanner: false,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '🔹 $title',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildText(String text, {double fontSize = 16}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilash Portfolio"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://bilash.ci-gsc.com/images/user-image.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bilash Kumar Mondol',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text('Web Developer'),
                  const SizedBox(height: 10),
                  const Text('Merul Badda, Dhaka'),
                  const Text('+8801705-372439'),
                  const Text('bilash0283@gmail.com'),
                  TextButton(
                    onPressed: () => _launchURL('https://github.com/bilash0283'),
                    child: const Text('GitHub Profile'),
                  ),
                  TextButton(
                    onPressed: () => _launchURL('https://bilash.ci-gsc.com'),
                    child: const Text('Live Portfolio Site'),
                  ),
                ],
              ),
            ),

            // Summary
            sectionTitle('SUMMARY'),
            buildText(
              'A motivated and detail-oriented Web Developer with strong skills in PHP (Laravel), JavaScript, MySQL, ReactJS, Bootstrap, Tailwind CSS, WordPress, and Flutter.',
            ),

            // Education
            sectionTitle('EDUCATION'),
            buildText('🎓 Diploma in Computer Engineering (4 Years)'),
            buildText('Naogaon Polytechnic Institute, Naogaon'),
            buildText('Board: BTEB | Year: 2021 | GPA: 3.72 / 4.00'),
            const SizedBox(height: 8),
            buildText('🎓 SSC - Kaligram Dodangi High School'),
            buildText('Board: Rajshahi | Year: 2017 | GPA: 4.91 / 5.00'),

            // Work Experience
            sectionTitle('WORK EXPERIENCE'),
            buildText('📌 Web Developer – GSC (Nov 2024 – Present)'),
            buildText('Developing and maintaining web apps using PHP, Laravel, JavaScript.'),
            const SizedBox(height: 8),
            buildText('📌 PRAN-RFL Group (Oct 2023 – May 2024)'),
            buildText('Managed customer relationships, sales, distribution, product promotion.'),
            const SizedBox(height: 8),
            buildText('📌 Growth Apparel Ltd. (Jul 2022 – Jul 2023)'),
            buildText('Managed inventory and supported supply chain operations.'),
            const SizedBox(height: 8),
            buildText('📌 Ananta Huaxing Ltd. (Feb 2017 – Dec 2019)'),
            buildText('Handled computer operations and supported public service.'),

            // Projects
            sectionTitle('PROFESSIONAL PROJECTS'),
            buildText('📁 Portfolio'),
            TextButton(
              onPressed: () => _launchURL('https://bilash.ci-gsc.com'),
              child: const Text('Live Link'),
            ),
            TextButton(
              onPressed: () => _launchURL('https://github.com/bilash0283/Portfolio_2025'),
              child: const Text('GitHub Repo'),
            ),
            const SizedBox(height: 8),
            buildText('📁 GSC'),
            TextButton(
              onPressed: () => _launchURL('https://www.gsc.co.com'),
              child: const Text('Live Link'),
            ),
            TextButton(
              onPressed: () => _launchURL('https://github.com/bilash0283/gsc.co.com_fontend'),
              child: const Text('GitHub Repo'),
            ),
            const SizedBox(height: 8),
            buildText('📁 GSC - Portal'),
            TextButton(
              onPressed: () => _launchURL('https://ci-gsc.com/'),
              child: const Text('Live Link'),
            ),
            TextButton(
              onPressed: () => _launchURL('https://github.com/bilash0283/Protal_GSC'),
              child: const Text('GitHub Repo'),
            ),
            const SizedBox(height: 8),
            buildText('📁 Foodies'),
            TextButton(
              onPressed: () => _launchURL('https://foodiesappbd.netlify.app/'),
              child: const Text('Live Link'),
            ),
            TextButton(
              onPressed: () => _launchURL('https://github.com/bilash0283/foodies'),
              child: const Text('GitHub Repo'),
            ),

            // Technical Skills
            sectionTitle('TECHNICAL SKILLS'),
            buildText('Frontend: HTML, CSS, JavaScript, Bootstrap, Tailwind CSS, jQuery, ReactJS (Basic)'),
            buildText('Backend: PHP, Laravel, Flutter'),
            buildText('Database: MySQL, Firebase'),
            buildText('CMS: WordPress, GitHub'),

            // Training
            sectionTitle('ADDITIONAL INFORMATION'),
            buildText('💡 Microsoft Office – TTC Naogaon (6 Months)'),
            buildText('💡 Web App Development – LEDP (200 Hours)'),
            buildText('💡 Flutter App Development – Freelancing IT Office (6 Months)'),

            // Personal Info
            sectionTitle('PERSONAL DETAILS'),
            buildText('Full Name: Bilash Kumar Mondol'),
            buildText("Father's Name: Anil Chandra Mondol"),
            buildText("Mother's Name: Joyanti Rani Mondol"),
            buildText("Date of Birth: 01 July 2000"),
            buildText('District: Naogaon'),
            buildText('Religion: Hinduism'),
            buildText('Gender: Male'),
            buildText('Marital Status: Single'),
            buildText('Nationality: Bangladeshi'),
          ],
        ),
      ),
    );
  }
}
