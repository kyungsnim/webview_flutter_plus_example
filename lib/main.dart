import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter_plus_example/new_home.dart';

late ByteData fontData;
late ByteData fontData2;
late ByteData fontData3;
String completeHtml = '';
late Uri htmlUri;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    completeHtml = await addFontToHtml("""<div style=\"font-family:NanumMyeongjo\"><p style=\"line-height: 1.6em;\">아래 그림에서 점&nbsp;<span><span><svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:wrs=\"http://www.wiris.com/xml/mathml-extension\" height=\"22\" width=\"7\" wrs:baseline=\"17\" style=\"vertical-align: -5px; height: 22px; width: 7px;\"><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"2.5\" y=\"17\">I</text></svg></span></span>,&nbsp;<span><span><svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:wrs=\"http://www.wiris.com/xml/mathml-extension\" height=\"22\" width=\"16\" wrs:baseline=\"17\" style=\"vertical-align: -5px; height: 22px; width: 16px;\"><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"7.5\" y=\"17\">G</text></svg></span></span>는 각각&nbsp;<span><span><svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:wrs=\"http://www.wiris.com/xml/mathml-extension\" height=\"22\" width=\"51\" wrs:baseline=\"17\" style=\"vertical-align: -5px; height: 22px; width: 51px;\"><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"6.5\" y=\"17\">Δ</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"18.5\" y=\"17\">A</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"30.5\" y=\"17\">B</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"42.5\" y=\"17\">C</text></svg></span></span>의 내심과 무게중심이다.&nbsp;<span><span><svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:wrs=\"http://www.wiris.com/xml/mathml-extension\" height=\"27\" width=\"80\" wrs:baseline=\"22\" style=\"vertical-align: -5px; height: 27px; width: 80px;\"><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"2.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"6.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"10.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"14.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"18.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"22.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"6.5\" y=\"22\">A</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"18.5\" y=\"22\">B</text><text font-family=\"KaTeX_Main\" font-size=\"18\" text-anchor=\"middle\" x=\"34.5\" y=\"22\">=</text><text font-family=\"KaTeX_Main\" font-size=\"18\" text-anchor=\"middle\" x=\"49.5\" y=\"22\">4</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"58.5\" y=\"22\">c</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"70.5\" y=\"22\">m</text></svg></span></span>,&nbsp;<span><span><svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:wrs=\"http://www.wiris.com/xml/mathml-extension\" height=\"27\" width=\"81\" wrs:baseline=\"22\" style=\"vertical-align: -5px; height: 27px; width: 81px;\"><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"3.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"7.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"11.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"15.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"19.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main\" font-size=\"13\" text-anchor=\"middle\" x=\"23.5\" y=\"9\">⎯</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"6.5\" y=\"22\">A</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"18.5\" y=\"22\">C</text><text font-family=\"KaTeX_Main\" font-size=\"18\" text-anchor=\"middle\" x=\"35.5\" y=\"22\">=</text><text font-family=\"KaTeX_Main\" font-size=\"18\" text-anchor=\"middle\" x=\"50.5\" y=\"22\">3</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"59.5\" y=\"22\">c</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"71.5\" y=\"22\">m</text></svg></span></span>&nbsp;일 때,&nbsp;<span><span><svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:wrs=\"http://www.wiris.com/xml/mathml-extension\" height=\"22\" width=\"51\" wrs:baseline=\"17\" style=\"vertical-align: -5px; height: 22px; width: 51px;\"><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"6.5\" y=\"17\">Δ</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"18.5\" y=\"17\">A</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"30.5\" y=\"17\">D</text><text font-family=\"KaTeX_Main_Italic\" font-size=\"18\" font-style=\"italic\" text-anchor=\"middle\" x=\"43.5\" y=\"17\">E</text></svg></span></span>의 넓이는?</p><p style=\"line-height: 1.6em;\">&nbsp;</p><p style=\"text-align: center; line-height: 1.6em;\"><img class=\"image_resized\" style=\"width:69.06%;\" src=\"https://sprout-question-dev.s3.ap-northeast-2.amazonaws.com/question/삼각형의 무게중심 - 연습문제 11 (1)1694591905\"></p></div>""", "font/opentype");
    htmlUri = Uri.dataFromString(completeHtml,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
  }
  String getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        mimeType: mime)
        .toString();
  }

  Future<String> addFontToHtml(
      String htmlContent, String fontMime) async {
    fontData = await rootBundle.load("assets/fonts/KaTeX_Main-Regular.ttf");
    fontData2 = await rootBundle.load("assets/fonts/KaTeX_Main-Italic.ttf");
    fontData3 = await rootBundle.load("assets/fonts/NanumMyeongjo.ttf");
    final fontUri = getFontUri(fontData, fontMime).toString();
    final fontUri2 = getFontUri(fontData2, fontMime).toString();
    final fontUri3 = getFontUri(fontData3, fontMime).toString();
    final fontCss =
        '@font-face { font-family: KaTeX_Main; src: url($fontUri); } @font-face { font-family: KaTeX_Main-Italic; src: url($fontUri2); } @font-face { font-family: NanumMyeongjo; src: url($fontUri3); } ';
    return '<style>$fontCss</style>$htmlContent';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          child: Text('다음 페이지'),
          onPressed: () => Get.to(() => NewHome()),
        )
      ),
    );
  }
}
