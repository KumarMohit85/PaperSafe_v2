// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:paper_safe_v2/core/image_paths.dart';

class CategoriesItems {
  final String svgPath;
  final String title;
  CategoriesItems({
    required this.svgPath,
    required this.title,
  });
}

List<CategoriesItems> listCategoriesItems = [
  CategoriesItems(svgPath: ImagePaths.aadharLogo, title: "Identity"),
  CategoriesItems(svgPath: ImagePaths.educationLogo, title: "Education"),
  CategoriesItems(svgPath: ImagePaths.indianRupeeLogo, title: "Finance"),
  CategoriesItems(svgPath: ImagePaths.airplaneTicketLogo, title: "Travel"),
  CategoriesItems(svgPath: ImagePaths.vpnKeyLogo, title: "Passes"),
  CategoriesItems(svgPath: ImagePaths.healthHeartLogo, title: "Health"),
  CategoriesItems(svgPath: ImagePaths.othersLogo, title: "Other")
];
