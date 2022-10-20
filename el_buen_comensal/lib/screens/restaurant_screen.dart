import 'package:flutter/material.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/Restaurant.dart';
import '../providers/user_info_provider.dart';
import '../share preferences/Preferences.dart';




class RestaurantScreen extends StatefulWidget {
   
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  String sugerencia = "";
  String password = "";
  int calification = 0;

  void displaySuggestions(BuildContext context){
    showDialog(barrierDismissible: false,context: context, builder: (context){
      return AlertDialog(
        elevation: 5,
        title: Center(child: Text("Sugerencia")),
        shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10) ),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
               Card(
                color: Color.fromARGB(255, 216, 216, 216),
                child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: AppTheme.primary_yellow,
                  maxLines: 10, //or null 
                  decoration: InputDecoration.collapsed(hintText: "Escriba su sugerencia"),
                  style:  TextStyle(height: 1,fontSize: 14,),
                ),
              )
            )
            ],
          ),
        actions: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: AppTheme.primary_yellow,
              disabledColor: Color.fromARGB(255, 245, 212, 130),
              elevation: 0,
              onPressed: () {Navigator.pop(context);},
              child: Container(
                  width: 70,
                  height: 30,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Cancelar',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14))))
            ),
            SizedBox(width: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: AppTheme.primary_yellow,
              disabledColor: Color.fromARGB(255, 245, 212, 130),
              elevation: 0,
              onPressed: () {Navigator.pop(context);},
              child: Container(
                  width: 70,
                  height: 30,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Enviar',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14))))
            ),
            ],)

            

          ],
      );
    });
  }

  void displayComments(BuildContext context){
    showDialog(barrierDismissible: false,context: context, builder: (context){
      return AlertDialog(
        elevation: 5,
        title: Center(child: Text("Calificar")),
        shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10) ),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
               const Card(
                color: Color.fromARGB(255, 216, 216, 216),
                child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: AppTheme.primary_yellow,
                  maxLines: 6, //or null 
                  decoration: InputDecoration.collapsed(hintText: "Escriba su opinion"),
                  style:  TextStyle(height: 1,fontSize: 14,),
                ),
              )
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Calificación: "),
                SizedBox(width: 20),
                Container(
          width: 80,
          height: 50,
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0))),
              contentPadding: EdgeInsets.all(2),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                value: "1",
                style: TextStyle(fontSize: 14, color: AppTheme.dark_gray, ),
                iconEnabledColor: AppTheme.primary_yellow,
                iconDisabledColor: Color.fromARGB(255, 245, 212, 130),
                items: [
                  DropdownMenuItem(child: Center(child: Text("1")), value: "1"),
                  DropdownMenuItem(child: Center(child: Text("2")), value: "2"),
                  DropdownMenuItem(child: Center(child: Text("3")), value: "3"),
                  DropdownMenuItem(child: Center(child: Text("4")), value: "4"),
                  DropdownMenuItem(child: Center(child: Text("5")), value: "5"),
                ],
                onChanged: (value) {
                  setState(() {
                    calification = int.parse(value as String);
                  });
                },
                isExpanded: true,
              ),
            ),
          ),
        ),
              ],
            )
            ],
          ),
        actions: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: AppTheme.primary_yellow,
              disabledColor: Color.fromARGB(255, 245, 212, 130),
              elevation: 0,
              onPressed: () {Navigator.pop(context);},
              child: Container(
                  width: 70,
                  height: 30,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Cancelar',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14))))
            ),
            SizedBox(width: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: AppTheme.primary_yellow,
              disabledColor: Color.fromARGB(255, 245, 212, 130),
              elevation: 0,
              onPressed: () {Navigator.pop(context);},
              child: Container(
                  width: 70,
                  height: 30,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Enviar',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14))))
            ),
            ],)

            

          ],
      );
    });
  }

  void displayFavorite(BuildContext context){
    showDialog(barrierDismissible: false,context: context, builder: (context){
      return AlertDialog(
        elevation: 5,
        title: Text("Favoritos"),
        shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10) ),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Este es el contenido de la alerta'),
              SizedBox( height: 10 ),
              FlutterLogo( size: 100 )
            ],
          ),
        actions: [

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar')
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok')
            ),

          ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final Restaurant restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;
    double width = MediaQuery.of(context).size.width;
    
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CarouselImages(imgList: restaurant.images),
                    NumberPhotos(number: restaurant.images.length),
                    BackArrow(),
                  ],
                ),
                SizedBox(height: 30),
                Text(restaurant.name, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Container(color: AppTheme.dark_gray,height: 1,width: width*0.8,),
                SizedBox(height: 10),
                Text("Calificación General", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.star, color: restaurant.punctuation >= 1 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 36,),
                  Icon(Icons.star, color: restaurant.punctuation >= 2 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 36,),
                  Icon(Icons.star, color: restaurant.punctuation >= 3 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 36,),
                  Icon(Icons.star, color: restaurant.punctuation >= 4 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 36,),
                  Icon(Icons.star, color: restaurant.punctuation == 5 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 36,),
                  SizedBox(width: 5),
                  Text(restaurant.punctuation.toString(), style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                  
                ],),
                SizedBox(height: 10),
                _LineSeparator(),
      
                
      
      
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Horarios: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(restaurant.schedule, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Ubicación: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(restaurant.address, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Tipo de comida: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(restaurant.typeFood, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Precio Promedio: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text( restaurant.prices.toString() + " COP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 20),
                ButtonDowloadMenu(width: width, urlMenu: restaurant.menu),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("En Pocas Palabras ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(height: 5),
                  Text(restaurant.description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                ],),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonAddList(width: width,text: "Sugerir", icono: Icon(Icons.map_outlined, color: Colors.white, size: 24), color: Color(0xff04A997), action: (){ displaySuggestions(context);}),
                    ButtonAddList(width: width,text: "Calificar", icono: Icon(Icons.check, color: Colors.white, size: 24), color: Color(0xffA3D818),action: (){ displayComments(context);}),
                    ButtonAddList(width: width,text: "Añadir", icono: Icon(Icons.favorite, color: Colors.white, size: 24), color: Color(0xffEB6D4A),action: (){ displayFavorite(context);}),
                   
                   
                ]),
                SizedBox(height: 15),
              ]),
            ),
            _LineSeparator(),
            SizedBox(height: 30),
            Padding(padding:  EdgeInsets.symmetric(horizontal:20),
            child:Text("Opiniones de los comensales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),

            UsersComment(),
            UsersComment(),
            UsersComment(),
            SizedBox(height: 40)
          ],
        ),
      ),

      bottomNavigationBar: ButtonBarHome(position: 0),
    );

    
  }
}

class UsersComment extends StatelessWidget {
  const UsersComment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 20),
      Column(children: [
        Row(children: [
          Container(height: 70,child: Image(image: AssetImage("assets/man_comments.png",), fit: BoxFit.cover)),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            Text("Kevin Mateo Rodriguez", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            Text("22/05/2022",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            Row(children: [
              Icon(Icons.star, color: AppTheme.primary_yellow),
              Icon(Icons.star, color: AppTheme.primary_yellow),
              Icon(Icons.star, color: AppTheme.primary_yellow),
              Icon(Icons.star, color: AppTheme.primary_yellow),
              Icon(Icons.star, color: AppTheme.primary_yellow),
              SizedBox(width: 10),
              Text("5.0",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300))
            ],)
            ],
          )
          ], 
          )
        ],
      ),
      SizedBox(height: 10),
      Text("Ad quis laborum occaecat officia ut consectetur reprehenderit est incididunt. Ad sunt cupidatat aute irure ex. Eu veniam in fugiat labore officia proident laborum elit aute consectetur dolore.",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
      SizedBox(height: 20),
      Container(height: 1, color: AppTheme.dark_gray, width: double.infinity,)  
        ],
        
        ),
        
    );
  }
}

class ButtonAddList extends StatelessWidget {

  final Icon icono;
  final String text;
  final Color color;
  final Function action;

  const ButtonAddList({
    Key? key,
    required this.width, required this.icono, required this.text, required this.color, required this.action,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserInfoProvider>(context);
    return MaterialButton(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
     onPressed: () => action(),
     color: color,
     elevation: 0,
     child: Container(
       width: width*0.18,
       height: 60,
       padding: const EdgeInsets.symmetric(vertical: 10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         icono,
         SizedBox(width: 20),
          Align(alignment: Alignment.center,child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300))),
       ],
     ),
    )
                   );
  }
}

class ButtonDowloadMenu extends StatefulWidget {
  

  const ButtonDowloadMenu({
    Key? key,
    required this.width, required this.urlMenu,
  }) : super(key: key);

  final double width;
  final String urlMenu;

  @override
  State<ButtonDowloadMenu> createState() => _ButtonDowloadMenuState();
}

class _ButtonDowloadMenuState extends State<ButtonDowloadMenu> {

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url)async{
    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw 'no se pudo';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =Uri(scheme: 'http', host: '144.22.197.146', path: widget.urlMenu, port:8000 );
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppTheme.dark_gray,
      disabledColor: AppTheme.dark_gray,
      onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch);
                }),
      elevation: 0,
      child: Container(
        width: widget.width*0.6,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.download, color: AppTheme.primary_yellow ),
          SizedBox(width: 20),
          const Align(alignment: Alignment.center,child: Text('Descargar Menú', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300))),
        ],
      ),
    )
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 170,
      child: IconButton(
        icon: Icon(Icons.arrow_back_rounded, size: 50, color: Colors.white),
        onPressed: null,
      )
    );
  }
}

class NumberPhotos extends StatelessWidget {

  final int number;
  const NumberPhotos({
    Key? key, required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 210,
      right: 20,
      child: Container(
        height: 25,
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: AppTheme.dark_gray.withOpacity(0.7)),
        child: Text( number.toString() + " Fotos", style: TextStyle(color: Colors.white, fontSize: 16)),
        alignment:Alignment.center,
      ),
    );
  }
}

class _LineSeparator extends StatelessWidget {
  const _LineSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 1,
      
      decoration: BoxDecoration(
        border: null,
        color: Colors.black.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), 
            // changes position of shadow
          ),
        ],
      ),
    );
  }
}

