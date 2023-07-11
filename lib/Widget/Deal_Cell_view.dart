import 'package:appattack_provider/Model/CouponDetailsModel.dart';
import 'package:appattack_provider/Utility/Constant/color_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Deal_Cell_view extends StatelessWidget {
  Deal_Cell_view({super.key,required this.objModel});
  final CouponDetailsDataModel objModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:
      Container(
        height: 205,
        // color: ColorConstants.primary,
        child: Stack(alignment: Alignment.topCenter,

          children: [
            Container(
             height: 168,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "\$${objModel.savingAmount ?? "0"}",
                            style: TextStyle(fontSize: 12),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(50, 24),
                            foregroundColor: ColorConstants.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            side: BorderSide(
                                width: 2.0, color: ColorConstants.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              width :100,
                              height:100,
                              child:
                              Center(
                                child: const CircularProgressIndicator(

                                  color: ColorConstants.primary,


                                ),
                              ),
                            ),
                            imageUrl: objModel.couponImage ?? "",
                            width: 100,
                            height: 100,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Flexible(
                                        child: Text(
                                          objModel.couponTitle ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                     Text(
                                        objModel.shortDescription ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey),
                                      ),

                                    TextButton.icon(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all(
                                            ColorConstants.primary),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.location_city,
                                        size: 12.0,
                                      ),
                                      label: Text(
                                        'Main street Magic',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
             top: 165,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(ColorConstants.primary),
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_city,
                            size: 12.0,
                          ),
                          label: Text(
                            'Main street Magic',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        TextButton.icon(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(ColorConstants.primary),
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_city,
                            size: 12.0,
                          ),
                          label: Text(
                            'Main street Magic',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Column(
      //   children: [
      //     Container(
      //       height: 160,
      //       decoration: BoxDecoration(
      //           border: Border.all(
      //             color: Colors.grey,
      //           ),
      //           borderRadius: BorderRadius.all(Radius.circular(8))),
      //       child: Padding(
      //         padding: const EdgeInsets.all(5),
      //         child: Column(
      //           children: [
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 OutlinedButton(
      //                   onPressed: () {},
      //                   child: Text(
      //                     "\$24",
      //                     style: TextStyle(fontSize: 12),
      //                   ),
      //                   style: OutlinedButton.styleFrom(
      //                     minimumSize: Size(50, 24),
      //                     foregroundColor: ColorConstants.primary,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(12.0),
      //                     ),
      //                     side: BorderSide(
      //                         width: 2.0, color: ColorConstants.primary),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Image.asset(
      //                   "icon/icon.png",
      //                   width: 100,
      //                   height: 100,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.only(bottom: 5),
      //                         child: Text(
      //                           "Take \$1 OFF Every \$4",
      //                           textAlign: TextAlign.left,
      //                           style: TextStyle(
      //                               fontSize: 18, fontWeight: FontWeight.bold),
      //                         ),
      //                       ),
      //                       Text(
      //                         "Take \$1 OFF every \$4 Spend",
      //                         textAlign: TextAlign.left,
      //                         style: TextStyle(color: Colors.grey),
      //                       ),
      //                       // DotWidget(
      //                       //   dashColor: Colors.black,
      //                       //   dashHeight: 1,
      //                       //   dashWidth: 5,
      //                       // ),
      //                       TextButton.icon(
      //                         style: ButtonStyle(
      //                           foregroundColor: MaterialStateProperty.all(
      //                               ColorConstants.primary),
      //                           alignment: Alignment.centerLeft,
      //                         ),
      //                         onPressed: () {},
      //                         icon: Icon(
      //                           Icons.location_city,
      //                           size: 12.0,
      //                         ),
      //                         label: Text(
      //                           'Main street Magic',
      //                           style: TextStyle(fontSize: 12.0),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 20,right: 20),
      //       child: Container(
      //         height: 40,
      //         decoration: BoxDecoration(
      //             border: Border.all(
      //               color: Colors.grey,
      //             ),
      //             borderRadius: BorderRadius.all(Radius.circular(8))),
      //         child: Padding(
      //           padding: const EdgeInsets.all(5),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               TextButton.icon(
      //                 style: ButtonStyle(
      //                   foregroundColor:
      //                       MaterialStateProperty.all(ColorConstants.primary),
      //                   alignment: Alignment.centerLeft,
      //                 ),
      //                 onPressed: () {},
      //                 icon: Icon(
      //                   Icons.location_city,
      //                   size: 12.0,
      //                 ),
      //                 label: Text(
      //                   'Main street Magic',
      //                   style: TextStyle(fontSize: 12.0),
      //                 ),
      //               ),
      //               TextButton.icon(
      //                 style: ButtonStyle(
      //                   foregroundColor:
      //                       MaterialStateProperty.all(ColorConstants.primary),
      //                   alignment: Alignment.centerLeft,
      //                 ),
      //                 onPressed: () {},
      //                 icon: Icon(
      //                   Icons.location_city,
      //                   size: 12.0,
      //                 ),
      //                 label: Text(
      //                   'Main street Magic',
      //                   style: TextStyle(fontSize: 12.0),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
