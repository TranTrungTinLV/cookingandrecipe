import 'package:flutter/material.dart';

class SendFeedback extends StatelessWidget {
  const SendFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Gửi Góp Ý"),
        titleSpacing: 0.0,

      actions: [
        ElevatedButton(onPressed: (){}, child: Text("Gửi")),
        SizedBox(width: 10,)
      ],),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),
                "Chúng tôi rất vui nếu được nghe góp ý của bạn cho các kết quả tìm kiếm. Xin gửi chúng tôi góp ý của bạn để Cookpad có thể làm tốt hơn. Nếu bạn muốn có phản hồi từ đội ngũ hỗ trợ, vui"),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,

                ),
                hintText: "Viết ý kiến của bạn vào đây",
                hintStyle: TextStyle(
                  color: Colors.grey
                ), filled: true,
                fillColor: Colors.grey.shade100
              ),
            ),
            SizedBox(height: 10,),
            Text(
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),
                "Chúng tôi sẽ sử dụng thông tin này để hoàn thiện công cụ tìm kiêm cúa Cookpad. Khi góp ý này được gửi đi, bạn đã đông ý để chúng tôi sử dụng thông tin đó theo Chính Sách Bảo Mật và Điều Khoản Dịch Vụ của công")
          ],
        ),
      ),
    );
  }
}
