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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final _passwordController = TextEditingController();
  bool _confirmChecked = false;
  bool _isPasswordVisible = false;
  bool _isDeleting = false;
  String _errorMessage = '';

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _deleteUserData(String uid) async {
    //
    // IMPORTANT: You must add your own database deletion logic here.
    //
    // For example, if you have a 'users' collection:
    // await FirebaseFirestore.instance.collection('users').doc(uid).delete();
    //
    // Also delete data from any other collections related to the user.
    // For example, from your 'UserReports' collection:
    // final reportsQuery = FirebaseFirestore.instance.collection('UserReports').where('userId', isEqualTo: uid);
    // final reportSnapshots = await reportsQuery.get();
    // for (var doc in reportSnapshots.docs) {
    //   await doc.reference.delete();
    // }
    //
    return;
  }

  Future<void> _handleDelete() async {
    setState(() {
      _isDeleting = true;
      _errorMessage = '';
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || user.email == null) {
        throw FirebaseAuthException(code: 'no-user');
      }

      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: _passwordController.text,
      );

      await user.reauthenticateWithCredential(cred);
      await _deleteUserData(user.uid);
      await user.delete();

      if (mounted) {
        context.goNamed('YourLoginPageName');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        _errorMessage = 'Incorrect password. Please try again.';
      } else if (e.code == 'requires-recent-login') {
        _errorMessage =
            'This is a sensitive action. Please sign out and sign back in before deleting your account.';
      } else {
        _errorMessage = 'An error occurred. Please try again.';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred. Please try again.';
    } finally {
      if (mounted) {
        setState(() {
          _isDeleting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final bool canDelete =
        _passwordController.text.isNotEmpty && _confirmChecked;

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      appBar: AppBar(
        backgroundColor: theme.primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          'Delete Account',
          style: theme.headlineMedium,
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        color: theme.error, size: 24),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This action is permanent and irreversible.',
                            style:
                                theme.titleMedium?.copyWith(color: theme.error),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'All of your data, including your profile, generated content, and settings will be permanently deleted. Any active subscriptions will be cancelled according to App Store policies.',
                            style: theme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Confirm Your Password',
                style: theme.bodyLarge,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Enter your password...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage,
                    style: theme.bodyMedium?.copyWith(color: theme.error),
                  ),
                ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text(
                  'I understand that my account and all associated data will be permanently deleted.',
                  style: theme.bodyMedium,
                ),
                value: _confirmChecked,
                onChanged: (newValue) {
                  setState(() {
                    _confirmChecked = newValue ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: theme.primary,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: canDelete && !_isDeleting ? _handleDelete : null,
                child: _isDeleting
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text('Delete My Account Permanently'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: theme.error,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: theme.alternate,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
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
