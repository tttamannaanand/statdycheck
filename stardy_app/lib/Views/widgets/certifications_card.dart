import 'package:flutter/material.dart';

class CertificationsCard
    extends StatelessWidget {
  const CertificationsCard({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        right: 10,
      ),

      padding:
          const EdgeInsets.all(
        20,
      ),

      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(
          34,
        ),

        gradient:
            const LinearGradient(
          begin:
              Alignment.topLeft,
          end:
              Alignment.bottomRight,

          colors: [
            Color(0xFF2D2E35),
            Color(0xFF1E1F24),
          ],
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const Text(
            'Certifications',
            style: TextStyle(
              color:
                  Colors.white,
              fontSize: 20,
              fontWeight:
                  FontWeight.w700,
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          _certificationTile(
            'Human-Centered Design',
          ),

          const SizedBox(
            height: 10,
          ),

          _certificationTile(
            'Responsive Web Design',
          ),

          const SizedBox(
            height: 10,
          ),

          _certificationTile(
            'Excel for Analytics',
          ),
        ],
      ),
    );
  }

  Widget _certificationTile(
    String title,
  ) {
    return Container(
      height: 48,

      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
      ),

      decoration:
          BoxDecoration(
        borderRadius:
            BorderRadius.circular(
          18,
        ),

        color:
            Colors.white
                .withOpacity(
          0.08,
        ),
      ),

      child: Row(
        children: [
          const Icon(
            Icons.picture_as_pdf,
            size: 18,
            color:
                Color(
              0xFFBE1E4A,
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          Expanded(
            child: Text(
              title,
              overflow:
                  TextOverflow
                      .ellipsis,

              style:
                  const TextStyle(
                color:
                    Colors
                        .white,
                fontSize:
                    12,
                fontWeight:
                    FontWeight
                        .w500,
              ),
            ),
          ),

          const Icon(
            Icons.download,
            color:
                Color(
              0xFFBE1E4A,
            ),
            size: 18,
          ),

          const SizedBox(
            width: 10,
          ),

          const Icon(
            Icons
                .remove_red_eye_outlined,
            color:
                Color(
              0xFFBE1E4A,
            ),
            size: 18,
          ),
        ],
      ),
    );
  }
}