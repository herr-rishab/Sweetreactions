// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalPage extends StatefulWidget {
  const LegalPage({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LegalPage> createState() => _LegalPageState();
}

class _LegalPageState extends State<LegalPage> with TickerProviderStateMixin {
  late TabController _tabController;

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
    final theme = FlutterFlowTheme.of(context);

    final String privacyPolicyText = '''
## Privacy Policy

**Effective Date: August 9, 2025**

SWEETREACTIONS PRIVATE LIMITED ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the "App").

### 1. Information We Collect

We may collect information about you in a variety of ways. The information we may collect via the App depends on the content and materials you use, and includes:

**A. Personal Data You Provide to Us**
* **Account Information:** When you create an account, we collect your email address and name.
* **Health & Wellness Data:** With your explicit consent, we collect data from your Continuous Glucose Monitor (CGM), including glucose readings and timestamps, to provide the core functionality of the App. This is sensitive data, and we treat it with the highest standard of care.
* **User Feedback:** If you report content or provide feedback, we collect the information you provide in your report, including the reason for the report and any descriptive text.

**B. Data We Collect Automatically**
* **Usage Data:** We automatically collect information about your interaction with the App, such as features you use and the time, frequency, and duration of your activities.
* **Device Data:** We may collect device information, such as your mobile device ID, model, and manufacturer, and information about the location of your device.
* **Firebase:** We use Firebase for services such as authentication, database management, and analytics. Firebase may collect certain data as governed by Google's Privacy Policy.

### 2. How We Use Your Information

We use the information we collect to:
* Create and manage your account.
* Provide, operate, and maintain the App's services.
* Analyze your health data to generate insights and personalized feedback.
* Improve, personalize, and expand our services.
* Communicate with you, either directly or through one of our partners, for customer service, to provide you with updates, and for other informational purposes.
* Process your reports and feedback to maintain a safe environment.
* Monitor and analyze trends, usage, and activities in connection with our App.

### 3. How We Share Your Information

We do not sell your personal data. We may share information we have collected about you in certain situations:
* **With Your Consent:** We may share your information with third parties when you have given us explicit consent to do so.
* **Third-Party Service Providers:** We may share your information with third parties that perform services for us or on our behalf, such as data analysis (Firebase Analytics), cloud hosting (Firebase), and authentication.
* **By Law or to Protect Rights:** We may disclose your information if required to do so by law or in the good faith belief that such action is necessary to (i) comply with a legal obligation, (ii) protect and defend our rights or property, or (iii) protect the personal safety of users of the App or the public.

### 4. Data Retention and Deletion

We retain your personal data for as long as your account is active or as needed to provide you with our services. You may delete your account at any time through the "Delete Account" feature within the App's settings. Upon deletion, we will permanently and irreversibly remove your personal data from our systems, subject to any legal obligations to retain certain information.

### 5. Security of Your Information

We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable.

### 6. Children's Privacy

Our services are not intended for use by children under the age of 16, and we do not knowingly collect personal information from children under 16.

### 7. Changes to This Privacy Policy

We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this screen.

### 8. Contact Us

If you have questions or comments about this Privacy Policy, please contact us at: **[Your Support Email Address]**
''';

    final String termsOfServiceText = '''
## Terms of Service

**Effective Date: August 9, 2025**

Please read these Terms of Service ("Terms") carefully before using the mobile application (the "App") operated by SWEETREACTIONS PRIVATE LIMITED ("we," "our," or "us").

### 1. Agreement to Terms

By creating an account and using our App, you agree to be bound by these Terms. If you do not agree to these Terms, do not use the App.

### 2. **CRITICAL HEALTH DISCLAIMER**

**Our App is not a medical device and does not provide medical advice.** The information, insights, and suggestions generated by the App are for informational purposes only. They are not intended to be a substitute for professional medical advice, diagnosis, or treatment.

**Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.** Never disregard professional medical advice or delay in seeking it because of something you have read or seen on this App.

### 3. User Accounts

When you create an account with us, you must provide information that is accurate, complete, and current at all times. You are responsible for safeguarding the password that you use to access the App and for any activities or actions under your password.

### 4. Prohibited Activities

You agree not to use the App for any unlawful purpose or to engage in any of the following prohibited activities:
* Providing false, inaccurate, or misleading information.
* Harassing, abusing, or harming another person.
* Using the service to build a competitive product.
* Attempting to bypass any measures of the App designed to prevent or restrict access.

### 5. Intellectual Property

The App and its original content, features, and functionality are and will remain the exclusive property of SWEETREACTIONS PRIVATE LIMITED and its licensors.

### 6. Termination

We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the App will immediately cease.

### 7. Limitation of Liability

In no event shall SWEETREACTIONS PRIVATE LIMITED, nor its directors, employees, or partners, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, or other intangible losses, resulting from your use of the App.

### 8. Governing Law

These Terms shall be governed and construed in accordance with the laws of India, without regard to its conflict of law provisions.

### 9. Changes to Terms

We reserve the right, at our sole discretion, to modify or replace these Terms at any time. We will provide notice of any changes by posting the new Terms on this screen.

### 10. Contact Us

If you have any questions about these Terms, please contact us at: **[Your Support Email Address]**
''';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          'Legal Information',
          style: theme.headlineMedium,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: theme.primary,
          unselectedLabelColor: theme.secondaryText,
          indicatorColor: theme.primary,
          tabs: [
            Tab(text: 'Terms of Service'),
            Tab(text: 'Privacy Policy'),
          ],
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MarkdownBody(
                data: termsOfServiceText,
                selectable: true,
                onTapLink: (text, href, title) {
                  if (href != null) launchUrl(Uri.parse(href));
                },
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MarkdownBody(
                data: privacyPolicyText,
                selectable: true,
                onTapLink: (text, href, title) {
                  if (href != null) launchUrl(Uri.parse(href));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
