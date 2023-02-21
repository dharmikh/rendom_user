import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_user/Screen/Model/HomeModel.dart';
import 'package:rendom_user/Screen/Provider/Home_Provider.dart';
import 'package:rendom_user/utils/Http_Api.dart';
import 'package:sizer/sizer.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;

  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    ProviderFalse= Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "RANDOM DATA",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 1.5.w),
              child: IconButton(
                onPressed: () async {
                  ProviderFalse!.Refresh(await ApiHttp().getApi());
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/image/Night.jpg",fit: BoxFit.fill,),
            ),
            Container(
              child: FutureBuilder<HomeModel?>(
                  future: ApiHttp().getApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      ProviderFalse!.Refresh(snapshot.data!);
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 20.h,
                                width: 40.w,
                                margin: EdgeInsets.only(bottom: 1.5.h),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.deepPurple),
                                    color: Colors.black),
                                child: Container(
                                  child: Image.network(
                                    "${ProviderTrue!.data!.results![0].picture!.large}",fit: BoxFit.cover,),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${ProviderTrue!.data!.results![0].name!.title} ${ProviderTrue!.data!.results![0].name!.first} ${ProviderTrue!.data!.results![0].name!.last}",
                                style:
                                TextStyle(color: Colors.white, fontSize: 25.sp),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 3.h,
                              alignment: Alignment.topLeft,
                              // color: Colors.yellow,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Name :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].name!.title} ${ProviderTrue!.data!.results![0].name!.first} ${ProviderTrue!.data!.results![0].name!.last}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Email :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].email}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              // color: Colors.yellow,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Phone :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].phone}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              // color: Colors.yellow,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Cell :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].cell}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Address :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].location!.street!.number} ${ProviderTrue!.data!.results![0].location!.street!.name}, ${ProviderTrue!.data!.results![0].location!.city},\n${ProviderTrue!.data!.results![0].location!.state}, ${ProviderTrue!.data!.results![0].location!.country} -${ProviderTrue!.data!.results![0].location!.postcode}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Dob Date :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].dob!.date}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "Dob Age :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].dob!.age}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.h,
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "NAT :",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "${ProviderTrue!.data!.results![0].nat}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }),
            )
          ],

        ),
      ),
    );
  }
}
