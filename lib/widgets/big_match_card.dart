import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/livescore.dart';

class BigMatchCard extends StatelessWidget {
  final Response response;

  const BigMatchCard({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff34183D),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            '${response.league!.name}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${response.fixture!.venue!.name}',
            style: const TextStyle(
              color: Color.fromARGB(255, 146, 101, 157),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 20),
          //home v away
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: '${response.teams!.home!.logo}',
                      height: 60,
                      width: 60,
                    ),
                    Text(
                      '${response.teams!.home!.name}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Color.fromARGB(255, 146, 101, 157),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '${response.goals!.home} : ${response.goals!.away}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    decoration: BoxDecoration(
                        color: const Color(0xff5B3964),
                        border: Border.all(
                            color: const Color(0xffAB4271), width: 2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "${response.fixture!.status!.elapsed}'",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ), //${response.events![index].time!.elapsed},
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.network('${response.teams!.away!.logo}',
                          height: 60, width: 60),
                    ),
                    Text(
                      '${response.teams!.away!.name}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Away',
                      style: TextStyle(
                        color: Color.fromARGB(255, 146, 101, 157),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
