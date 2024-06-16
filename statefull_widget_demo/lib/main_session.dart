import 'package:flutter/material.dart';

void main() {
  runApp(myApplication());
}

class myApplication extends StatelessWidget {
  const myApplication({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
} 

//statelesswide lifecycle => build
//statefulwidge lifecycle => create state -> init state ->  didChangeDependancies -> didUpdateDependancies -> build -> deactivite -> dispose

//init state => constructor like
//didChangeDependancies => used for navigation.the URL changed when navigating -> ex. home/onboard or home/login 
//didUpdateDependancies => when refreshed what all changed and then rebuild them. it is done internally via cache
//