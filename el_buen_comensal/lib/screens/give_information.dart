import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GiveInformationScreen extends StatefulWidget {
  const GiveInformationScreen({Key? key}) : super(key: key);

  @override
  State<GiveInformationScreen> createState() => _GiveInformationScreenState();
}

class _GiveInformationScreenState extends State<GiveInformationScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: controller,
      children: [
        Page1(controller: controller),
        Page2(controller: controller),
        Page3(controller: controller),
        Page4(controller: controller),
      ]),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.dark_gray,
      child: Column(children: [
    SizedBox(height: 150),
    Container(
    height: 350,
    width: 350,
    child: Image(
      image: AssetImage("assets/image_page4.png"),
    )),
    SizedBox(height: 30),
    Text(
      "Selecciona algun ambiente de preferencia",
      style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 20),
    Container(
      width: 300,
      height: 80,
      child: InputDecorator(
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(4.0))),
        contentPadding: EdgeInsets.all(10),
        
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        dropdownColor: AppTheme.dark_gray,
        value: "1",
        style: TextStyle(fontSize: 20, color: Colors.white),
        iconEnabledColor: AppTheme.primary_yellow,
        
        items: [
        DropdownMenuItem(child:Text("Ambiente Familiar"), value: "1"),
        DropdownMenuItem(child:Text("Ambiente Friends"), value: "2"),
        DropdownMenuItem(child:Text("Ambiente Solitario"), value: "3")
      ], onChanged: (value){
        print(value);
      },
      isExpanded: true,),
    ),
      ),
    ),
    SizedBox(height: 20),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
    color: AppTheme.primary_yellow,
    disabledColor: AppTheme.primary_yellow,
    onPressed: (){
      Navigator.pushReplacementNamed(context, "home");
    },
    elevation: 0,
    child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(
            horizontal: 60, vertical: 10),
        child: const Align(
            alignment: Alignment.center,
            child: Text('Terminar',
                style:
                    TextStyle(color: Colors.white, fontSize: 20)))),
      ),
    )
      ]),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
    SizedBox(height: 150),
    Container(
        height: 350,
        width: 350,
        child: Image(
          image: AssetImage("assets/image_page3.png"),
        )),
    SizedBox(height: 30),
    Text(
      "Selecciona algun interes",
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppTheme.dark_gray),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 20),
    Container(
      width: 300,
      height: 80,
      child: InputDecorator(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(4.0))),
            contentPadding: EdgeInsets.all(10),
            
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            value: "1",
            style: TextStyle(fontSize: 20, color: AppTheme.dark_gray),
            iconEnabledColor: AppTheme.primary_yellow,
            
            items: [
            DropdownMenuItem(child:Text("Restaurante Gourmet"), value: "1"),
            DropdownMenuItem(child:Text("Restaurante familiar"), value: "2"),
            DropdownMenuItem(child:Text("Restaurante tipo Buffet"), value: "3"),
            DropdownMenuItem(child:Text("Restaurante Tematico"), value: "4"),
            DropdownMenuItem(child:Text("Comida Rapida"), value: "5"),
          ], onChanged: (value){
            print(value);
          },
          isExpanded: true,),
        ),
      ),
    ),
    SizedBox(height: 20),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        color: AppTheme.primary_yellow,
        disabledColor: AppTheme.primary_yellow,
        onPressed: (){
          controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        elevation: 0,
        child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(
                horizontal: 60, vertical: 10),
            child: const Align(
                alignment: Alignment.center,
                child: Text('Siguiente',
                    style:
                        TextStyle(color: Colors.white, fontSize: 20)))),
      ),
    )
      ]),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.dark_gray,
      child: Column(children: [
    SizedBox(height: 150),
    Container(
        height: 350,
        width: 350,
        child: Image(
          image: AssetImage("assets/image_page2.png"),
        )),
    SizedBox(height: 10),
    Text(
      "Pregunta",
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 20),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
          "¿Te consideras una persona vegetariana?",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          textAlign: TextAlign.center),
    ),
    SizedBox(height: 30),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            color: AppTheme.primary_yellow,
            disabledColor: AppTheme.primary_yellow,
            onPressed: (){
              controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            elevation: 0,
            child: Container(
                width: 80,
                height: 50,
                padding: const EdgeInsets.symmetric( vertical: 10),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text('Si',
                        style:
                            TextStyle(color: Colors.white, fontSize: 20)))),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            color: AppTheme.primary_yellow,
            disabledColor: AppTheme.primary_yellow,
            onPressed: (){
              controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            elevation: 0,
            child: Container(
                width: 80,
                height: 50,
                padding: const EdgeInsets.symmetric(
                    vertical: 10),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text('No',
                        style:
                            TextStyle(color: Colors.white, fontSize: 20)))),
          )
        ],
      ),
    )
      ]),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        SizedBox(height: 180),
        Container(
            height: 350,
            width: 350,
            child: Image(
              image: AssetImage("assets/image_page1.png"),
            )),
        SizedBox(height: 30),
        Text(
          "¡Comencemos!",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.dark_gray),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
              "Proporciona información sobre tus gustos y preferencias",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppTheme.dark_gray),
              textAlign: TextAlign.center),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            color: AppTheme.primary_yellow,
            disabledColor: AppTheme.primary_yellow,
            onPressed: (){
              controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            elevation: 0,
            child: Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(
                    horizontal: 60, vertical: 10),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text('Siguiente',
                        style:
                            TextStyle(color: Colors.white, fontSize: 20)))),
          ),
        )
      ]),
    );
  }
}
