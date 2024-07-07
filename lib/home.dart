import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) {
      setState(() {
        _supportState = isSupported;
      });
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print("List of available biometrics: $availableBiometrics");
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Biometrics Auth"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
           children: 
          [
           SizedBox(height: 80,),
           Center(
            child: Text("login",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
           ),
            SizedBox(height: 50,),
           Center(
            child: Text("fingerprint auth",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
           ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 28,vertical: 5),
                  child: Center(
                    child: Text("Authentication using fingerprint to proceed in application"),

                  ),),
                  SizedBox()    
          ]
          
          
        ),
      ),
    );
  }
}
