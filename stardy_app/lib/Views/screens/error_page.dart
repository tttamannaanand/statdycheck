import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ErrorPageType { server, network }

class ErrorPage extends StatelessWidget {
  final ErrorPageType type;
  final VoidCallback? onRetry;

  const ErrorPage({super.key, this.type = ErrorPageType.server, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final isNetwork = type == ErrorPageType.network;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "Uh oh!",
                style: GoogleFonts.mukta(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),

              SizedBox(height: 14),

              Text(
                isNetwork
                    ? "Something went wrong\nPlease check your internet connection and try again"
                    : "Something went wrong at our end\nDon't worry, it's not you — it's us. Sorry about that",

                textAlign: TextAlign.center,

                style: GoogleFonts.mukta(
                  fontSize: 15,
                  color: Colors.grey.shade500,
                  height: 1.5,
                ),
              ),

              SizedBox(height: 44),

              Image.asset(
                isNetwork
                    ? 'assets/images/error_network.png'
                    : 'assets/images/error_server.png',
                width: 260,
              ),

              SizedBox(height: 52),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                onPressed: onRetry ?? () => Navigator.of(context).maybePop(),

                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      "Retry",
                      style: GoogleFonts.mukta(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(width: 8),

                    const Icon(Icons.refresh_rounded, size: 18, color: Colors.black),
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
