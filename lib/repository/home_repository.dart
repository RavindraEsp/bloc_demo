
import '../model/home_model.dart';

class HomeRepository {
  Future<List<HomeItem>> fetchHomeData() async {
    // simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    // fake API response
     List.generate(
      10,
          (index) => HomeItem(
        id: index,
        title: 'Item ${index + 1}',
      ),
    );

     return List.generate(10, (index){

       return HomeItem(id: index, title: "item $index");
     });
  }
}
