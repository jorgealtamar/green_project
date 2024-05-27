import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none, // same that overflow
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/man.png'),
            backgroundColor: Colors.transparent,
           ),
           Positioned(
            bottom: 0,
            right: -12,
             child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  backgroundColor: const MaterialStatePropertyAll(Color(0xFFF5F6F9)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white)
                      )
                    )
                  ),
                onPressed: (){},
                child: const Icon(BootstrapIcons.camera, color: primaryColor,),
              ),
             ),
           )
        ],
      ),
    );
  }
}