// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../bussiness/blocs/blocs.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imageUrl;
  const CustomImageContainer({
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffold = ScaffoldMessenger.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        height: 130,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            top: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            bottom: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            left: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            right: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
        ),
        child: (imageUrl == null)
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  alignment: Alignment.bottomRight,
                  icon: Icon(
                    Icons.add_circle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () async {
                    ImagePicker _picker = ImagePicker();
                    final XFile? _picture =
                        await _picker.pickImage(source: ImageSource.gallery);

                    if (_picture == null) {
                      _scaffold.showSnackBar(
                        const SnackBar(content: Text('No image was selected!')),
                      );
                    } else {
                      print('Uploading...');
                      context
                          .read<OnboardingBloc>()
                          .add(UpdateUserImages(image: _picture));
                      print('Uploaded');
                    }
                  },
                ),
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
