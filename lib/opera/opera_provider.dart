import 'package:flutter/cupertino.dart';

class OperaProvider extends ChangeNotifier
{

  List<OperaModel> platformlist = [
    OperaModel(name: "Amazon Prime",link: "https://www.primevideo.com/",logo: "https://sm.ign.com/ign_in/cover/p/prime-vide/prime-video_bpe3.jpg"),
    OperaModel(name: "Netflix",link: "https://www.netflix.com/in/",logo: "https://play-lh.googleusercontent.com/TBRwjS_qfJCSj1m7zZB93FnpJM5fSpMA_wUlFDLxWAb45T9RmwBvQd5cWR5viJJOhkI"),
    OperaModel(name: "Amazon Mini",link: "https://www.amazon.in/minitv",logo: "https://yt3.googleusercontent.com/fBNVJ-Ywc2Kp8Ph-0EvCxP-JKk1aFAs-8Hbh0SCbwegM5_0ErzZkSyQVZEhxxk5xbubUwcnOMaA=s900-c-k-c0x00ffffff-no-rj"),
    OperaModel(name: "Voot",link: "https://www.voot.com/",logo: "https://www.robosoftin.com/assets/img/work/voot/img_voot_challenge.webp"),
    OperaModel(name: "Zee5",link: "https://www.zee5.com/",logo: "https://www.adgully.com/img/800/201906/zee5.jpg"),
    OperaModel(name: "AltBalaji",link: "https://www.altbalaji.com/",logo: "https://www.exchange4media.com/news-photo/113485-103460-altbalaji.jpg"),
    OperaModel(name: "HotStar",link: "https://www.hotstar.com/in",logo: "https://play-lh.googleusercontent.com/Vd6XKGvZKp8r3Ikz4vRykNJaMjFULqftsqviOsMPepYTOu4ef-4HkUo3iEcPpOi4c2s"),
    OperaModel(name: "SonyLiv",link: "https://www.sonyliv.com/",logo: "https://images.news18.com/ibnlive/uploads/2020/06/1592394351_sonyliv-new-logo.jpg"),
    OperaModel(name: "Discovery +",link: "https://www.discoveryplus.in/",logo: "https://www.flickonclick.com/wp-content/uploads/2022/09/How-to-Get-Discovery-Plus-Subscription-for-Free-696x522.jpg"),
    OperaModel(name: "TATAPlay",link: "https://www.tataplaybinge.com/",logo: "https://yt3.googleusercontent.com/Gy0oXhS6bUEA6Jwib3qGE6nCvOFYaTQdD2UsmO-uwhZy1rIrbgcIcxJGdZVfjV7XcfPoRjwRKw=s900-c-k-c0x00ffffff-no-rj"),
    OperaModel(name: "W3School",link: "https://www.w3schools.com/",logo: "https://yt3.googleusercontent.com/dW6to0x5Crmeh7yi-YPLcQRqVrBtx2BSh8eoKTJbE8NbjloQ0sqlmdszIlxokJU_97-ndOt_=s900-c-k-c0x00ffffff-no-rj"),
    OperaModel(name: "JavatPoint",link: "https://www.javatpoint.com/",logo: "https://scontent.fnag1-4.fna.fbcdn.net/v/t39.30808-6/280163166_5718564198159073_1283895210009043583_n.jpg?_nc_cat=101&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=nKmuGvHKB2UAX-hpKRG&_nc_ht=scontent.fnag1-4.fna&oh=00_AfDf98TdF312wrlQ02BJlVW98l4Oy_-eclvAV8EqwwJA_Q&oe=646D1BC7"),
    OperaModel(name: "TutorialsPoint",link: "https://www.tutorialspoint.com/index.htm",logo: "https://play-lh.googleusercontent.com/FCMz5gMEQlgvAn99DzjX9Z2CuQ_MY2aInD1j87Y7uC1cimimyI2YjvHeqGVFyPW6EQ"),
    OperaModel(name: "GreatLearning",link: "https://www.mygreatlearning.com/",logo: "https://play-lh.googleusercontent.com/__khQwKnFNT-XLg_3jEZiL2fAAzEunNoPh_Q8qd-c3Hq9kX_KL0vR7vnWOM6vBZCdBy0"),
    OperaModel(name: "SimpliLearn",link: "https://www.simplilearn.com/",logo: "https://pbs.twimg.com/profile_images/707557253637742592/8xPxraAg_400x400.jpg"),
    OperaModel(name: "FreeCodeCamp",link: "https://www.freecodecamp.org/",logo: "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/ikqra03zdnggljdu5vv0"),

// https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh2T3nN7X9hI953BvBfAiJ4dxhEC9kisPPgVuGpIDJgekeisFxwWoKLTIxhaYuaiUiyJ0&usqp=CAU

  ];

  void call_speedDial({String? name, String? link})
  {
    OperaModel om = OperaModel();
    om = OperaModel(
        name: name,link: "https://www.$link/",
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh2T3nN7X9hI953BvBfAiJ4dxhEC9kisPPgVuGpIDJgekeisFxwWoKLTIxhaYuaiUiyJ0&usqp=CAU");
    platformlist.add(om);

    notifyListeners();
  }

}














class OperaModel
{
  String? name,link,logo;

  OperaModel({this.name, this.link, this.logo});
}