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

    _sub = appLinks.uriLinkStream.listen(
      (Uri? uri) {
        if (uri == null) return;

        final host = uri.host;
        final scheme = uri.scheme;
        final params = uri.queryParameters;

        final isDevcodeReset = host == 'password-reset';
        final isSupabaseLoginCallback =
            host == 'login-callback' && scheme.startsWith('io.supabase');
        final isRecoveryParam = params['type'] == 'recovery';

        if (isDevcodeReset ||
            (isSupabaseLoginCallback && isRecoveryParam) ||
            (isSupabaseLoginCallback && params.isEmpty)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamed('/update-password');
          });
        }
      },
      onError: (err) {
        // ignore errors
      },
    );
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
