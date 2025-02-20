import 'package:get/get_state_manager/get_state_manager.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';
import '/service/weather_service.dart';

class HomeController extends GetxController {
  String city;
  String? searchText;
  CurrentWeatherData? currentWeatherData; // جعلها قابلة لأن تكون null
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city}) {
    if (city.isEmpty) {
      this.city = 'Cairo'; // قيمة افتراضية
    }
  }

  @override
  void onInit() {
    super.onInit();
    initState();
    getTopFiveCities();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    if (city.isEmpty) {
      print("Error: City is null or empty");
      return;
    }

    WeatherService(city: city).getCurrentWeatherData(
      onSuccess: (data) {
        currentWeatherData = data;
        update();
      },
      onError: (error) {
        print("Error fetching current weather: $error");
        update();
      },
    );
  }

  void getTopFiveCities() {
    List<String> cities = ['Zagazig', 'London', 'Alexandria', 'Fayoum', 'Giza'];

    for (String c in cities) {
      WeatherService(city: c).getCurrentWeatherData(
        onSuccess: (data) {
          dataList.add(data);
          update();
        },
        onError: (error) {
          print("Error fetching weather for $c: $error");
          update();
        },
      );
    }
  }

  void getFiveDaysData() {
    if (city.isEmpty) return;

    WeatherService(city: city).getFiveDaysThreeHoursForcastData(
      onSuccess: (data) {
        fiveDaysData = data;
        update();
      },
      onError: (error) {
        print("Error fetching 5-day forecast: $error");
        update();
      },
    );
  }
}
