import 'package:beautilly/data/beauty_card_data.dart';
import 'package:beautilly/utils/colors.dart';
import 'package:beautilly/widget/share_widget/beauty_card.dart';
import 'package:beautilly/widget/share_widget/face_page.dart';
import 'package:flutter/material.dart';

class FaceTreatment extends StatefulWidget {
  const FaceTreatment({super.key});

  @override
  State<FaceTreatment> createState() => _FaceTreatmentState();
}

class _FaceTreatmentState extends State<FaceTreatment> {
  //fetch the beauty card data from beauty card data class
  final beautyData = BeautyCardData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/targetAudience.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                          itemCount: beautyData.treatmentTypeDataList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return beautyCard(
                              description: beautyData
                                  .treatmentTypeDataList[index].descroiption,
                              imageUrl: beautyData
                                  .treatmentTypeDataList[index].imageUrl,
                              context: context,
                              index: index
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        facePage(context),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          Text("View More Details",style: TextStyle(color: bWhite,fontSize: 14,fontWeight: FontWeight.w400),),
                          Icon(Icons.keyboard_arrow_down_sharp,color: bWhite,size: 25,)
                        ],),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}