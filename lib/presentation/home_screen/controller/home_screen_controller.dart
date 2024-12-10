import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/presentation/home_screen/models/user_model.dart';
import 'package:task/presentation/home_screen/repository/home_screen_repo.dart';

class HomeScreenController extends GetxController {
  UserModel? userModel;

  var totalDummyFine = 1000.0.obs;

  var isLoading = false.obs;

  void getFoodData({month}) async {
    isLoading.value = true;
    update();

    try {
      var body = {'month': month};
      var data = await HomeScreenRepo.getFoodData(body: body);
      userModel = UserModel.fromJson(data);

      if (data != null) {
        Future.delayed(const Duration(seconds: 2), () {
          calculateTotalFine();
          totalDummyFine.value = 0;
          update();
        });
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
      update();
    }
  }

  @override
  void onReady() {
    getFoodData(month: 12);
    selectedIndex.value = 12;
    super.onReady();
  }

  String formateDate({inputDate}) {
    List<String> parts = inputDate.split("-");
    String year = parts[0];
    String month = parts[1].padLeft(2, '0');
    String day = parts[2].padLeft(2, '0');

    String correctedDate = "$year-$month-$day";
    DateTime parsedDate = DateTime.parse(correctedDate);
    String formattedDate = DateFormat("d MMM yyyy").format(parsedDate);

    return formattedDate;
  }

  double calculateTotalFine() {
    double totalFine = 0;

    userModel?.reports?.forEach((report) {
      if (report.optIns?.breakfast == "Pending") {
        totalFine += 100;
      }
      if (report.optIns?.lunch == "Pending") {
        totalFine += 100;
      }
      if (report.optIns?.dinner == "Pending") {
        totalFine += 100;
      }
    });

    return totalFine;
  }

  var selectedIndex = 0.obs;

  void updateIndex({val}) {
    selectedIndex.value = val;
    update();
  }
}
