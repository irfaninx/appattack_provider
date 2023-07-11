
import 'package:flutter/Material.dart';

class redeem_coupon_view extends StatelessWidget {
  const redeem_coupon_view({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Show this screen at time of redemption for store to press 'YES'. Redeem now?",textAlign: TextAlign.center,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(onPressed:() {

                    }, child: const Text("YES",style: TextStyle(fontSize: 20),)),
                  ),
                ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(onPressed:() {
                        Navigator.pop(context);
                      }, child: const Text("NO",style: TextStyle(fontSize: 20),)),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
