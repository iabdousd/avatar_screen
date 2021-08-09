import 'package:avatar_screen/bloc/avatar_bloc.dart';
import 'package:avatar_screen/constants/theme.dart';
import 'package:avatar_screen/widgets/avatar_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AvatarViewHeader extends StatelessWidget {
  const AvatarViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: .023 * size.height,
          horizontal: .04 * size.height,
        ),
        child: BlocBuilder<AvatarBloc, AvatarState>(
          builder: (context, state) {
            return Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: .185 * size.width,
                      height: .185 * size.width,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 0.03 * size.width,
                            right: 0.03 * size.width,
                            left: 0.03 * size.width,
                            bottom: 0.03 * size.width,
                            child: SvgPicture.asset(
                              'assets/svgs/avatar_bg.svg',
                            ),
                          ),
                          if (state.noAvatar)
                            Positioned(
                              top: 0.036 * size.width,
                              right: 0.036 * size.width,
                              left: 0.036 * size.width,
                              bottom: 0.036 * size.width,
                              child: SvgPicture.asset(
                                'assets/svgs/avatar_null.svg',
                              ),
                            )
                          else
                            Positioned(
                              top: 0.005 * size.width,
                              right: 0.005 * size.width,
                              left: 0.005 * size.width,
                              bottom: 0.005 * size.width,
                              child: AvatarPreview(
                                transparent: true,
                                margin: EdgeInsets.zero,
                                customSize: Size(size.width / 1.8, 0),
                              ),
                            ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Image.asset(
                              'assets/svgs/avatar_ring.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.03 * size.width,
                        ),
                        height: 32,
                        decoration: BoxDecoration(
                          color: kLightBlueColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: kComplementaryBlueColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/svgs/edit_ic.svg',
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 32,
                                child: TextFormField(
                                  initialValue: state.name,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(4.0),
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                  onChanged: (_) =>
                                      context.read<AvatarBloc>().add(
                                            UpdateNameEvent(_),
                                          ),
                                  style: TextStyle(
                                    height: 1.625,
                                    fontSize: 16,
                                  ),
                                  scrollPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: .125 * size.width),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Image.asset(
                      'assets/svgs/close_btn_idle.png',
                      width: .08 * size.width,
                      height: .08 * size.width,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
