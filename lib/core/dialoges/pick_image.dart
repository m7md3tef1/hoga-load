
import 'package:flutter/material.dart';

import '../../features/auth/domain/auth_cubit.dart';


class PickImageDialoge extends StatelessWidget {
  const PickImageDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SimpleDialog(
              title: const Text(('Select...'),),
              children: [
                SimpleDialogOption(
                    child: const Text(('Pick From Camera'),),
                    onPressed: () {
                     AuthCubit.get(context).pickFromCamera(context);
                    }),
                SimpleDialogOption(
                    child: const Text(('Pick From Gallery'),),
                    onPressed: () {
                      AuthCubit.get(context).pickFromGallery(context);
                    }),
              ],
            );

  }
}
