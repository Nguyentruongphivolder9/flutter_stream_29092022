import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DemoStreamPage extends StatefulWidget {
  const DemoStreamPage({Key? key}) : super(key: key);

  @override
  State<DemoStreamPage> createState() => _DemoStreamPageState();
}

class _DemoStreamPageState extends State<DemoStreamPage> {

  @override
  void didUpdateWidget(covariant DemoStreamPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 1: Single Subscription

    // Khởi tạo Stream thông qua Future
    // Future<String> future = Future.delayed(Duration(seconds: 1), () => "Hello");
    
    // Stream<String> textStream = Stream.fromFuture(future);

    // textStream.listen((event) {
    //   print(event);
    // });

    // Khởi tao Stream thông qua Iterable
    // Iterable<int> iterable = Iterable.generate(10, (index) {
    //   return index;
    // });
    // Stream<int> numberStream = Stream.fromIterable(iterable);
    // numberStream.listen((event) {
    //   print(event);
    // });

    // Khởi tạo Stream thông qua periodic
    // Stream<int> streamPeriodic = Stream.periodic(Duration(seconds: 1), (count) => count).asBroadcastStream();

    // var subscription = streamPeriodic.listen((event) {
    //   print("Listen1 $event");
    // });
    // streamPeriodic.listen((event) {
    //   if(event == 5) {
    //     subscription.pause();
    //   }
    // });

    // 2: Stream Controler

    StreamController<String> textControler = StreamController.broadcast();

    Stream<String> periodic = Stream.periodic(Duration(seconds: 1), (count) {
      return count.toString();
    });

    textControler.sink.addStream(periodic);
    // Thêm dữ liệu (sink)
    // textControler.sink.add("Teo");
    // textControler.sink.add("Ty");

    // Lấy dữ liệu (stream)
    textControler.stream.take(10).listen((event) {
      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Stream"),
      ),
      body: Container(

      ),
    );
  }
}