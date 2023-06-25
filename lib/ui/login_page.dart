import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  String text='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            backgroundColor: Colors.indigo,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Text('Login:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          _controller=value as TextEditingController;
                        },
                        controller: _controller,
                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    Text('Password:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        backgroundColor: const MaterialStatePropertyAll<Color>(Colors.red)
                      ),
                        onPressed: (){}, child: const Text('Log out')))
              ],
            ),
          ),
        ),
    );
  }
}
