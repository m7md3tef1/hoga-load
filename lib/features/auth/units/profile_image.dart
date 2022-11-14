import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../core/dialoges/pick_image.dart';
import '../../../widgets/widgets/custom_text.dart';
import '../domain/auth_cubit.dart';

class ProfileImage extends StatelessWidget {
  var image;
  ProfileImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          AuthCubit.get(context).image == null
              ? const Icon(
                  Icons.account_circle,
                  size: 100,
                )
              : Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.transparent),
                  height: 100,
                  width: 100,
                  child: Image.file(
                    image,
                    fit: BoxFit.fill,
                  )),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => const PickImageDialoge());
            },
            child: CustomText(
              text: AuthCubit.get(context).image == null
                  ? 'Add Image'
                  : 'Change Image',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: ColorManager.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
