import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'terms_and_conditions_model.dart';
export 'terms_and_conditions_model.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late TermsAndConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: 100.0,
          height: 100.0,
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: double.infinity,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, FlutterFlowTheme.of(context).secondary],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                child: Text(
                  'Terms and Conditions',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Container(
                    width: 356.0,
                    height: 685.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Text(
                              'Effective Date: 22.01.2025\n\nWelcome to EasyMeds (\"the App\"), a mobile application designed to help users set reminders for taking medications. By downloading, accessing, or using EasyMeds, you agree to comply with these Terms and Conditions. If you do not agree, please refrain from using the App.\n\n1. General Use\n1.1. Eligibility: You must be at least 18 years old to use this App. If you are under 18, you may only use the App under the supervision of a parent or legal guardian who agrees to these Terms.\n\n1.2. Personal Use: The App is intended solely for personal, non-commercial use. You may not copy, modify, distribute, or sell any part of the App without prior written consent.\n\n1.3. Account Creation: You may need to create an account to use certain features. You are responsible for maintaining the confidentiality of your login information and all activities under your account.\n\n2. Medical Disclaimer\n2.1. Informational Purposes Only: EasyMeds is not a medical device and does not provide medical advice, diagnosis, or treatment. The App is designed to help you organize and remind you to take medications as scheduled.\n\n2.2. Consult Professionals: Always consult a licensed medical professional for any health concerns or questions about your medications. Do not rely solely on the App for managing your health.\n\n2.3. No Guarantees: While the App aims to provide accurate reminders, EasyMeds does not guarantee the timeliness or reliability of notifications. It is your responsibility to verify medication schedules and take them as prescribed.\n\n3. User Responsibilities\n3.1. Accurate Information: You are responsible for entering accurate and up-to-date information about your medications, dosages, and schedules.\n\n3.2. Compliance: You must comply with all local laws and regulations regarding prescription medications and their use.\n\n3.3. Prohibited Activities: You agree not to:\n\nUse the App for illegal purposes.\nUpload viruses or malicious code.\nAttempt to reverse-engineer or hack the App.\nShare false or misleading information through the App.\n4. Privacy Policy\n4.1. Data Collection: EasyMeds collects and processes personal data, including medication schedules, to provide App services. For details on how your data is used and protected, please refer to our Privacy Policy.\n\n4.2. Third-Party Services: The App may integrate with third-party services. EasyMeds is not responsible for the privacy practices of such third parties.\n\n5. Limitation of Liability\n5.1. No Warranties: The App is provided \"as is\" and \"as available\" without warranties of any kind, express or implied.\n\n5.2. Limitation: EasyMeds and its developers are not liable for:\n\nAny missed medication reminders or health complications resulting from missed doses.\nLosses or damages resulting from unauthorized access to your account.\nAny technical issues or interruptions in service.\n5.3. Maximum Liability: In no event shall EasyMeds’ liability exceed the amount you paid (if any) for using the App.\n\n6. Intellectual Property\n6.1. Ownership: All content, features, and functionalities of the App are the exclusive property of EasyMeds or its licensors. Unauthorized use is prohibited.\n\n6.2. Feedback: By submitting feedback, suggestions, or ideas, you grant EasyMeds the right to use them without restriction or compensation.\n\n7. Termination\n7.1. EasyMeds reserves the right to suspend or terminate your account at its discretion, without notice, for violating these Terms or engaging in unlawful activities.\n\n7.2. Upon termination, your right to use the App ceases immediately. You may request deletion of your data as outlined in the Privacy Policy.\n\n8. Modifications to Terms\nEasyMeds reserves the right to modify these Terms and Conditions at any time. Changes will be communicated via the App or email. Continued use of the App after changes constitutes acceptance of the updated Terms.\n\n9. Governing Law\nThese Terms and Conditions are governed by the laws of [Insert Jurisdiction]. Any disputes arising from these Terms will be resolved in the courts of [Insert Jurisdiction].\n\n10. Contact Us\nIf you have questions or concerns about these Terms and Conditions, please contact us at:\n\nEmail: support@easymeds.com\n\nBy using EasyMeds, you acknowledge that you have read, understood, and agree to these Terms and Conditions.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
