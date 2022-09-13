import 'package:bmi/feature/reminder/reminder_screen.dart';
import 'package:bmi/models/reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../resources/constants.dart';
import 'components/add_reminder_sheet.dart';
import 'home_screen_provider.dart';

// Water (in litres) to drink a day = Your Weight (in Kg) multiplied by 0.033. For example, if you are 60kg, you should drink about 2 litres of water every single day. At 90kg, you'll around about 3 litres of water. All you need to do is multiply 0.033 to your weight in Kg
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<HomeScreenProvider>(context, listen: false);
    provider.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              ConstantTexts.kAPP_NAME,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.3,
                          lineWidth: 15,
                          animation: true,
                          percent: 70 / 100,
                          progressColor: Colors.blue,
                          backgroundColor: Colors.white,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "75",
                                    style: MyTheme.kNumberStyle,
                                  ),
                                  Text(
                                    "%",style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "1800/2500 ml",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Water Quantity",
                    //       textAlign: TextAlign.left,
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //       ),
                    //     ),
                    //     SizedBox(height: 10),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         Icon(Icons.arrow_back_ios),
                    //         Expanded(child: quantitySelector()),
                    //         Icon(Icons.arrow_forward_ios),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Record",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        recordData(provider.reminderList),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async{
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReminderScreen(),
                ),
              );
              await provider.fetchReminders();
            },
            child: provider.showDelete
                ? Icon(Icons.delete)
                : Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget quantitySelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '250 ML',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '250 ML',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '250 ML',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '250 ML',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget recordData(List<Reminder> reminderList) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = reminderList[index];
        DateTime now = item.date;
        String formattedTime = DateFormat.jm().format(now);
        return Card(
          color: Colors.transparent,
          child: ListTile(
            leading: item.isCompleted ? Icon(Icons.done) : Icon(Icons.alarm),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.quantity.toString()),
                Text(formattedTime),
              ],
            ),
            trailing: item.isEnabled
                ? IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  )
                : IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // provider.deleteReminder(index);
                    },
                  ),
          ),
        );
      },
      itemCount: reminderList.length,
    );
  }
}
