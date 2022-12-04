import 'package:flutter/material.dart';
import 'package:tangle/presentation/widgets/user_image.dart';
import '../../../data/models/models.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Hero(
              tag: 'user_image',
              child: UserImage.large(
                url: user.imageUrls[0],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(150, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}, ${user.age}',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    user.jobTitle,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: user.imageUrls.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return (index < user.imageUrls.length)
                            ? UserImage.small(
                                url: user.imageUrls[index],
                                margin: const EdgeInsets.only(top: 8, right: 8),
                              )
                            : Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.info_outline,
                                  size: 25,
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                      }),
                    ),
                  )
                  // Row(
                  //   children: [
                  //     UserImageSmall(imageUrl: user.imageUrls[1]),
                  //     UserImageSmall(imageUrl: user.imageUrls[1]),
                  //     UserImageSmall(imageUrl: user.imageUrls[1]),
                  //     UserImageSmall(imageUrl: user.imageUrls[1]),
                  //     const SizedBox(width: 10),
                  //     Container(
                  //       width: 25,
                  //       height: 25,
                  //       decoration: const BoxDecoration(
                  //         color: Colors.white,
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: const Icon(Icons.info_outline),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
