import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

class DeepLinkHandler extends StatefulWidget {
  final Widget child;
  const DeepLinkHandler({required this.child, super.key});

  @override
  State<DeepLinkHandler> createState() => _DeepLinkHandlerState();
}

class _DeepLinkHandlerState extends State<DeepLinkHandler> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    final appLinks = AppLinks();

    // Handle initial link (when app is opened from email)
    _handleInitialLink(appLinks);

    // Handle subsequent links (when app is already running)
    _sub = appLinks.uriLinkStream.listen(
      (Uri? uri) {
        if (uri != null) {
          _handleIncomingLink(uri);
        }
      },
      onError: (err) {
        print('Deep link error: $err');
      },
    );
  }

  Future<void> _handleInitialLink(AppLinks appLinks) async {
    try {
      final uri = await appLinks.getInitialLink();
      if (uri != null) {
        // Add a delay to ensure the widget tree is ready
        await Future.delayed(const Duration(milliseconds: 500));
        _handleIncomingLink(uri);
      }
    } catch (err) {
      print('Initial link error: $err');
    }
  }

  void _handleIncomingLink(Uri uri) {
    print('Received deep link: $uri');

    final host = uri.host;
    final scheme = uri.scheme;
    final params = uri.queryParameters;

    print('Host: $host, Scheme: $scheme, Params: $params');

    final isDevcodeReset = host == 'password-reset';
    final isSupabaseLoginCallback =
        host == 'login-callback' && scheme.startsWith('io.supabase');
    final isRecoveryParam = params['type'] == 'recovery';

    if (isDevcodeReset ||
        (isSupabaseLoginCallback && isRecoveryParam) ||
        (isSupabaseLoginCallback && params.containsKey('access_token'))) {
      print('Navigating to update password page...');

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/update-password',
            (route) => false, // Clear all previous routes
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
