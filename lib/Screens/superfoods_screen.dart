import 'package:flutter/material.dart';
import '../cards/FoodCard.dart';
import '../cards/food_detail_screen.dart';

class FoodData {
  final String foodName;
  final String imagePath;
  final String description;

  FoodData({
    required this.foodName,
    required this.imagePath,
    required this.description,
  });
}

class SuperfoodScreen extends StatefulWidget {
  const SuperfoodScreen({Key? key}) : super(key: key);

  @override
  State<SuperfoodScreen> createState() => _SuperfoodScreenState();
}

class _SuperfoodScreenState extends State<SuperfoodScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Superfoods'),
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Veg'),
              Tab(text: 'Non - Veg'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1 content
            TabContent(
              foods: [
                FoodData(
                  foodName: 'Almonds',
                  imagePath: 'assets/foods/almonds.jpg',
                  description:
                      'Almonds are rich in important nutrients for your body, including magnesium, vitamin E, and fiber. Almonds have both calcium and phosphorus, which are good for bone health. Almonds seem to help curb blood sugar spikes after meals, which is key for people with diabetes.',
                ),
                FoodData(
                  foodName: 'All kinds of Fruits',
                  imagePath: 'assets/foods/fruits.jpg',
                  description:
                      '''Fruits are an excellent source of essential vitamins and minerals, and they are high in fiber. Fruits also provide a wide range   of health-boosting antioxidants, including flavonoids. Eating a diet high  in fruits and vegetables can reduce a person\'s risk of developing heart  disease, cancer, inflammation, and diabetes.''',
                ),
                FoodData(
                    foodName: 'All kinds of indian lentils',
                    imagePath: 'assets/foods/lentils.jpg',
                    description:
                        '''Lentils are a plentiful source of fiber, folic acid, and   potassium. These nutrients all support heart health. According to the American  Heart Association (AHA), increased fiber intake can reduce levels of low density  lipoprotein (LDL) cholesterol, or bad cholesterol.'''),
                FoodData(
                  foodName: 'oats',
                  imagePath: 'assets/foods/oats.jpg',
                  description:
                      '''Oatmeal is nutritionally rich. It has more protein than most  grains and also contains numerous vitamins and minerals. It contains antioxidants  and a soluble fiber called beta-glucan, which aids several systems of the body.  The beta-glucan soluble fiber promotes regular emptying of the bowel and prevents   constipation.''',
                ),
                FoodData(
                  foodName: 'Peanuts',
                  imagePath: 'assets/foods/peanuts.jpg',
                  description:
                      '''Peanuts are a good source of fiber, which helps reduce inflammation   throughout your body as well as aids your digestive system. Research has demonstrated   that for older people, eating peanut butter may help lower the risk of developing a certain  type of stomach cancer called gastric non cardia adenocarcinoma.''',
                ),
                FoodData(
                  foodName: 'Diary Products',
                  imagePath: 'assets/foods/milkproducts.jpg',
                  description:
                      '''Eating or drinking dairy products offers health benefits, like building and maintaining strong bones. Dairy Group foods provide nutrients that are vital for the health and maintenance of the body. These nutrients include calcium, potassium, vitamin D,and protein.''',
                )
              ],
              
            ),
            // Tab 2 content
            TabContent(
              foods: [
                FoodData(
                  foodName: 'Fish',
                  imagePath: 'assets/foods/fish.jpg',
                  description:
                      '''Fish is filled with omega-3 fatty acids and vitamins such as D and B2 (riboflavin). Fish is rich in calcium and phosphorus and a great source of minerals, such as iron, zinc, iodine, magnesium,  and potassium. The American Heart Association recommends eating fish at least two times per week as part of a healthy diet.''',
                ),
                FoodData(
                  foodName: 'Egg',
                  imagePath: 'assets/foods/egg.jpg',
                  description:
                      '''Eggs can provide a number of health benefits. Strong muscles:  The protein in eggs helps maintain and repair body tissues, including muscle. Brain health: Eggs contain vitamins and minerals that are necessary for the  brain and the nervous system to function effectively.''',
                ),
                FoodData(
                  foodName: 'Chicken',
                  imagePath: 'assets/foods/chicken.jpg',
                  description:
                      """While chicken is a lean meat with loads of proteins, it is also high on cholesterol. However, chicken provides selenium which contains antioxidants that help control free radicals and improve your immune system.A 100gms of cooked chicken would usually contain 239  calories. Of 100gms, 27gms would be only protein which is important for growth and development of various organs in the body. Besides, chicken also helps in maintaining the desired body weight. Furthermore, it gives zinc and iron and is an excellent source for Vitamins B6, B12 and D""",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class TabContent extends StatelessWidget {
  final List<FoodData> foods;
  const TabContent({Key? key, required this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FoodDetailScreen(
                  foodName: food.foodName,
                  imagePath: food.imagePath,
                  description: food.description,
                ),
              ),
            );
          },
          child: FoodCard(
            foodName: food.foodName,
            imagePath: food.imagePath,
            description: food.description,
          ),
        );
      },
    );
  }
}