import 'dart:convert';

import 'package:berita/model/berita_model.dart';
import 'package:berita/page/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<BeritaModel> data = [];

  Future<void> getBerita()async{
    var result = await http.get(Uri.parse('https://portal.bangkabaratkab.go.id/berita.json'));
    setState(() {
      data = (json.decode(result.body)['berita'] as List?) != null &&
          (json.decode(result.body)['berita'] as List).isNotEmpty
          ? (json.decode(result.body)['berita'] as List)
          .map((f) => BeritaModel.fromJson(f))
          .toList()
          : [];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBerita();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita Kominfo',
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: data.length,
        itemBuilder: (ctx,index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (ctx){
                  return DetailPage(data: data[index],);
                }
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 16,
                      offset: Offset(4, 0)
                  )
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    child: Image.network(
                      data[index].foto ?? '-',
                      width: 130,
                      height: 100,
                      fit: BoxFit.cover
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].judul ?? '-',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            data[index].sumber ?? '-',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            data[index].post ?? '-',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (ctx,index){
          return SizedBox(height: 10,);
        },
      ),
    );
  }
}
