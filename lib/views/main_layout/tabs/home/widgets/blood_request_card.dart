import 'package:flutter/material.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class BloodRequestCard extends StatelessWidget {
  const BloodRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: ColorsManeger.borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  fit: BoxFit.fill,
                  width:
                  MediaQuery.sizeOf(context).width * 0.13,
                  height:
                  MediaQuery.sizeOf(context).height * 0.06,
                  image: AssetImage(AssetsManeger.requestBlood),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Request blood",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "in progress ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsManeger.gray,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      ColorsManeger.red,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Donate'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 8,),
                Text(
                  "pateint",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Text(
                    "Islam Mohamed eltayeb",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorsManeger.gray
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 8,),
                Text(
                  "needs 9 units( Remining 4)  ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorsManeger.gray
                  ),
                ),
                Spacer(),
                Text(
                  "2024-2-10",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 8,)
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 8,),
                Icon(Icons.location_on_outlined,color: ColorsManeger.redWithOpacity5,),
                Expanded(
                  child: Text(
                    "Itay El Barud - El Beheira - Egypt",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsManeger.gray
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
