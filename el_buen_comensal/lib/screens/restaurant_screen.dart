import 'package:flutter/material.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/user_info_provider.dart';
import '../share preferences/Preferences.dart';




class RestaurantScreen extends StatelessWidget {
   
  const RestaurantScreen({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {

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
                    CarouselImages(),
                    NumberPhotos(),
                    BackArrow(),
                  ],
                ),
                SizedBox(height: 30),
                Text("La Esquina Real", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Container(color: AppTheme.dark_gray,height: 1,width: width*0.8,),
                SizedBox(height: 10),
                Text("Calificación General", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.star, color: AppTheme.primary_yellow, size: 36),
                  Icon(Icons.star, color: AppTheme.primary_yellow, size: 36),
                  Icon(Icons.star, color: AppTheme.primary_yellow, size: 36),
                  Icon(Icons.star, color: AppTheme.primary_yellow, size: 36),
                  Icon(Icons.star, color: AppTheme.primary_yellow, size: 36),
                  SizedBox(width: 5),
                  Text("5.0", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                  
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
                    Text("9:00 AM - 22:00 PM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Ubicación: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text("Cll 42 # 127 - 4", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Tipo de comida: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text("Colombiana", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Precio Promedio: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    Text("40.000 COP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 20),
                ButtonDowloadMenu(width: width),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("En Pocas Palabras ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(height: 5),
                  Text("Eiusmod anim aute ad do exercitation. Elit proident sunt occaecat tempor veniam eu ut reprehenderit. Laborum ex sit ipsum proident qui minim est sunt ipsum incididunt veniam consequat. Deserunt officia consequat sint esse mollit consectetur ex commodo tempor ipsum adipisicing irure adipisicing mollit. Nisi consequat sunt Lorem mollit. Labore qui esse qui fugiat.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                ],),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonAddList(width: width,text: "Añadir", icono: Icon(Icons.map_outlined, color: Colors.white, size: 24), color: Color(0xff04A997)),
                    ButtonAddList(width: width,text: "Calificar", icono: Icon(Icons.check, color: Colors.white, size: 24), color: Color(0xffA3D818)),
                    ButtonAddList(width: width,text: "Añadir", icono: Icon(Icons.favorite, color: Colors.white, size: 24), color: Color(0xffEB6D4A)),
                   
                   
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

      bottomNavigationBar: ButtonBarHome(),
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

  const ButtonAddList({
    Key? key,
    required this.width, required this.icono, required this.text, required this.color,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserInfoProvider>(context);
    return MaterialButton(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
     onPressed: () => print(userProvider.user!.idUser.toString()),
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

class ButtonDowloadMenu extends StatelessWidget {
  const ButtonDowloadMenu({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppTheme.dark_gray,
      disabledColor: AppTheme.dark_gray,
      onPressed: () => Navigator.pushNamed(context, 'home'),
      elevation: 0,
      child: Container(
        width: width*0.6,
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
  const NumberPhotos({
    Key? key,
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
        child: Text("3 Fotos", style: TextStyle(color: Colors.white, fontSize: 16)),
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
