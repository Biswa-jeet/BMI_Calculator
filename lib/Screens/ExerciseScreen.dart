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

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercises'),
          backgroundColor: Colors.deepPurpleAccent,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Cardio'),
              Tab(text: 'Weight-lifting'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1 content
            TabContent(
              foods: [
                FoodData(
                  foodName: 'Jumping Jacks',
                  imagePath: 'assets/Exercise/jumpingjack.jpg',
                  description:
                      'Jumping jacks offer full-body exercise, working muscles in your arms, legs, and core. They can strengthen your muscles, improve coordination, and boost your fitness. You can add traditional jumping jacks to your workouts. Or try variations — like step jacks or squat jacks — based on your fitness level.',
                ),
                FoodData(
                  foodName: 'Mountain Climbing',
                  imagePath: 'assets/Exercise/mountainclimb.jpg',
                  description:
                      'As a compound exercise that utilises multiple muscle groups in your whole body, mountain climbers are an effective way of strengthening your arms, back, shoulders, core and legs. Another benefit of using multiple muscles at once is an increased heart rate, which will help you burn more calories.',
                ),
                FoodData(
                    foodName: 'Jumping Rope',
                    imagePath: 'assets/Exercise/rope.jpg',
                    description:
                        'There are numerous ways to lose weight, skipping rope is one of the effective methods for it. However, skipping rope alone is not enough to lose weight but also it requires a planned diet, weight loss goals, commitment, and high activity level. You also need to consider some other factors like age, previous illnesses/ surgeries before starting exercise as it may affect your rate of weight loss.If you jump rope for 30 minutes to one hour daily you will lose almost 200-300 calories. But beginners can’t do it straight for 30 minutes, you may need some time to increase your duration.'),
                FoodData(
                    foodName: 'Plyo Squat',
                    imagePath: 'assets/Exercise/plyo.jpg',
                    description:
                        'Calorie burning is often equated with aerobic exercises such as running or cycling. But performing high-intensity, compound movements like the squat can also crush some serious calories.For example, according to Harvard Medical School, a 155-pound person can burn approximately 223 calories doing 30-minutes of vigorous strength or weight training exercises, like squats.'),
                FoodData(
                  foodName: 'Prisoner Squat',
                  imagePath: 'assets/Exercise/prisonsquat.jpg',
                  description:
                      'Your lower body boasts some of your largest and most powerful muscles.From getting out of bed, to sitting down in a chair, your glutes, quadriceps, hamstrings, adductors, hip flexors, and calves are responsible for almost every move you make.Strength training exercises like squats can help strengthen and tone the muscles in your lower body. When these muscles are in good condition, you may find that you can move more comfortably, with less pain, and that everything from walking to bending to exercising is easier to do.',
                ),
                FoodData(
                  foodName: 'Burpees',
                  imagePath: 'assets/Exercise/burpees.jpg',
                  description:
                      "Because burpees double as cardio and strength training, the exercise is a go-to choice for folks who want to burn calories and fat. In just one minute, you might be able to burn upwards of 15 calories. Over time, this will mean helping you lose fat. Remember, the burpee provides practically a full body workout. All the muscles involved will need to work extra hard, and they’ll use up calories for the energy they need and ultimately help you to slim down.",
                )
              ],
            ),
            // Tab 2 content
            TabContent(
              foods: [
                FoodData(
                    foodName: 'Bench Press',
                    imagePath: 'assets/Exercise/benchpress.jpg',
                    description:
                        'The bench press is the go-to for muscle growth, and for good reason. It recruits a majority of the muscle fibers in the pectorals and takes the chest through a respectable range of motion. As the pec major is taxed heavily in the bench press and is responsible for the bulk of the “meat” of the chest, the bench press is second to none for making chest gains.'),
                FoodData(
                    foodName: 'Dumbell Rowing',
                    imagePath: 'assets/Exercise/rowing.jpg',
                    description:
                        'Dumbbell rows work muscle groups in your upper body.Although the dumbbell row prioritizes your back muscles, it also provides a comprehensive upper-body workout by activating several other muscle groups, including your chest muscles, core muscles, glutes, lower back muscles, and triceps.'),
                FoodData(
                    foodName: 'Shoulder Press',
                    imagePath: 'assets/Exercise/shoulderpress.jpg',
                    description:
                        'The shoulder press is an upper-body exercise that targets muscles such as the trapezoid, the deltoids, and the triceps. It\'s a fantastic activity for beginners and veterans alike, as it improves overall strength and posture and decreases the risk for osteoporosis.'),
                FoodData(
                    foodName: 'Deadlift',
                    imagePath: 'assets/Exercise/deadlift.jpg',
                    description:
                        'Deadlifts place a big emphasis on your lower body, including your glutes, quads, and hamstrings, resulting in strong and dense legs. Adding deadlifts to your training plan will take your leg strength to another level. One study found that subjects who did deadlifts twice per week for 10 weeks increased their rapid torque capacities in their knee extensors and flexors (aka quads and hamstrings), increasing their vertical jump.'),
                FoodData(
                    foodName: 'Bicep Curl',
                    imagePath: 'assets/Exercise/bicep.jpg',
                    description:
                        'Apart from building muscle size, boosting athletic performance and facilitating daily activities, bicep curls build strength in the upper arm, train shoulder to be more stable and teaches the practitioner\'s core to engage.')
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