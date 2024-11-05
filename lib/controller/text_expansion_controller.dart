import 'package:get/get.dart';

class TextExpansionController extends GetxController {
  var isExpanded = false.obs;
  var expandText = "more".obs;
  toggleExpansion() {
    print("masuk bans");
    isExpanded.value = !isExpanded.value;
    expandText.value = isExpanded.value ? "less" : "more";
  }
}
