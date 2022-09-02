import 'package:berita/model/berita_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final BeritaModel? data;
  const DetailPage({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail'
        ),
      ),
      body: Column(
        children: [
          Image.network(
              data?.foto ?? '-',
            width: MediaQuery.of(context).size.width,
            height: 230,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data?.sumber ?? '-',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      data?.post ?? '-',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                  data?.judul ?? '-',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
