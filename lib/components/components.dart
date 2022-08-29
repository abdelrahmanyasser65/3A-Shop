import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/helper/cash_helper.dart';
import 'package:sh/screens/auth/loginscreen.dart';
import 'package:sh/themes/colors.dart';

import '../screens/homelayout/cubit/shop_cubit.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) =>
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));

class EElevatedButton extends StatefulWidget {
 final String text;
final String hColor;
final  Color textColor;
 final  onPressed;
final double height;
final double width;
final double radius;

  const EElevatedButton(
     this.hColor,
     this.height,
     this.radius,
     this.textColor,
     this.width,
     this.text,
     this.onPressed, {Key? key}
     ) : super(key: key);

  @override
  State<EElevatedButton> createState() => _EElevatedButtonState();
}

class _EElevatedButtonState extends State<EElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        primary: HexColor(widget.hColor),
      ),
      onPressed: widget.onPressed,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight:FontWeight.w500,
              fontSize: 16,
              color: widget.textColor
            ),
          ),
        ),
      ),
    );
  }
}
Text defaultText(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14,
      color: HexColor('#C1C7D0'),
      fontWeight: FontWeight.normal,
    ),
  );
}
TextFormField buildTextForm(
{
 required onChanged,
  required controller,
  required obscureText,
  required keyboardType,
  required hintText,
  required prefixIcon,
 required String text,

}
    ){
   return TextFormField(

     onChanged: onChanged,
     controller: controller,
     obscureText:obscureText ,
     cursorColor: Colors.grey,
     keyboardType:keyboardType,


     decoration: InputDecoration(
       hintText: hintText,
       hintStyle: TextStyle(
         fontSize: 13,
         color: HexColor(textColor),
       ),
       prefixIcon: Icon(
         prefixIcon,
         color: text.isNotEmpty?HexColor(caColor):HexColor(iconColor),
         size: 20,
       ),
       filled: true,
       fillColor: Colors.black.withOpacity(0.05),
       suffix: text.isNotEmpty?
           Container(
             margin:const EdgeInsets.only(top: 20),
             height: 20,
             width: 20,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
             border: Border.all(
               color:HexColor(caColor),
               width: 1.5
             ),
             ),
             child: Icon(
               Icons.check,
               color: HexColor(caColor),
               size: 16,
             ),
           ):null,
       border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(15),
           borderSide: BorderSide(
             width: 0,
             color: Colors.black.withOpacity(0.05),
           )),
       enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(15),
           borderSide: BorderSide(
             width: 0,
             color: Colors.black.withOpacity(0.05),
           )),
       disabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(15),
           borderSide: BorderSide(
             width: 0,
             color: Colors.black.withOpacity(0.05),
           )),
       focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(15),
           borderSide: BorderSide(
             width: 0,
             color: Colors.black.withOpacity(0.05),
           )),
     ),
   );
}
void singOut(context){
  CachHelper.removeData(key: 'token').then((value){
    if(value){
      navigateAndFinish(context, LoginScreen());
    }
  });
}
TextFormField buildTextFormField({ controller, hint, icon, type, onChange,}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    cursorColor: HexColor(caColor),
    onChanged:onChange,

    style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade700
    ),
    decoration: InputDecoration(
      hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600
      ),
      hintText: hint,
      prefixIcon: Icon(icon, color: HexColor(caColor),),
      fillColor: Colors.black.withOpacity(0.1),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 0,
            color: Colors.black.withOpacity(0.05),
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 0,
            color: Colors.black.withOpacity(0.05),
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 0,
            color: Colors.black.withOpacity(0.05),
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 0,
            color: Colors.black.withOpacity(0.05),
          )),
    ),
  );
}
Widget buildFavItem( fav, int index, ShopCubit cubit) {
  return Stack(
    children: [
      Padding(
        padding:
        const EdgeInsets.only(top: 20, left: 10, right: 13, bottom: 15),
        child: Row(
          children: [
            Image(
              image: NetworkImage(fav.product!.image!),
              height: 160,
              width: 160,

              // width: 180,
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fav.product!.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "EGP",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '${fav.product!.price.round()}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (fav.product!.discount != 0)
                                Text(
                                  'EGP ${fav.product!.oldPrice}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(
                                width: 3,
                              ),
                              if (fav.product!.discount != 0)
                                Text('${fav.product!.discount}%OFF',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor(caColor),
                                    )),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            cubit.changeFavorites(fav.product!.id!);
                          },
                          child: CircleAvatar(
                            backgroundColor: cubit.favorites[fav.product!.id]
                                ? HexColor(caColor)
                                : Colors.grey,
                            radius: 15,
                            child: const Icon(
                              Icons.favorite_border,
                              size: 14,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      if (fav.product!.discount != 0)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          color: Colors.red,
          child: const Text(
            'DISCOUNT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
    ],
  );
}

