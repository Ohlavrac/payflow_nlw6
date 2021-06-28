import 'package:flutter/material.dart';
import 'package:nlw_together_flutter/modules/extract/extract_page.dart';
import 'package:nlw_together_flutter/modules/home/home_controller.dart';
import 'package:nlw_together_flutter/modules/meus_boletos/meus_boletos_page.dart';
import 'package:nlw_together_flutter/shared/models/user_models.dart';
import 'package:nlw_together_flutter/shared/themes/app_colors.dart';
import 'package:nlw_together_flutter/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({ Key? key, required this.user }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: "Olá, ",
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: "${widget.user.name}",
                      style: TextStyles.titleBoldBackground,
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(widget.user.photoUrl!))
                ),
              )
            ),
          ),
        ),
      ),
      body: [
              MeusBoletosPage(
                key: UniqueKey(),
              ),
              ExtractPage(
                key: UniqueKey(),
              ),
            ][controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {
                  
                });
              },
              icon: Icon(
                Icons.home,
                color: controller.currentPage == 0 ? AppColors.primary : AppColors.body,
              ),
            ),
            GestureDetector(
              onTap: () async{
                await Navigator.pushNamed(context, "/barcode_scanner");
                setState(() {
                  
                });
              },
                child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child:  Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ), 
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {
                  
                });
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1 ? AppColors.primary : AppColors.body,
              ),
            ),
          ],
        )
      ),
    );
  }
}