import 'package:election_exit_poll_620710683/services/api.dart';
import 'package:flutter/material.dart';

class ShowScore extends StatefulWidget {
  static const routeName = '/show_page_page';
  const ShowScore({Key? key}) : super(key: key);



  @override
  _ShowScoreState createState() => _ShowScoreState();
}

class _ShowScoreState extends State<ShowScore> {
  late Future<List> _candidateList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
    fit: BoxFit.fill
    )
      ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Image.asset('assets/images/vote_hand.png', height: 100.0,),
                Text('EXIT POLL', style: TextStyle(color: Colors.white, fontSize: 24),),
                const SizedBox(
                  height: 30.0,
                ),
                Text('RESULT', style: TextStyle(color: Colors.white, fontSize: 28),),
                const SizedBox(
                  height: 15.0,
                ),
                FutureBuilder<List>(
                  future: _candidateList,
                  builder: (context, snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
                      return const CircularProgressIndicator();
                    }

                    if(snapshot.hasError){
                      return  Text("เกิดข้อผิดพลาด ${snapshot.error}");
                    }

                    if(snapshot.hasData){
                      var data = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            for(var i=0;i<snapshot.data!.length;++i)
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      color: Colors.green.withOpacity(0.95),
                                      child: Text('${data[i]['number']}', style: TextStyle(color: Colors.white, fontSize: 28), textAlign: TextAlign.center,),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50.0,
                                        color: Colors.white.withOpacity(0.95),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text('${data[i]['title']} ${data[i]['fullName']}', style: TextStyle(color: Colors.indigo, fontSize: 16)),
                                              const Expanded(child: SizedBox.shrink()),
                                              Text('${data[i]['score']}', style: TextStyle(color: Colors.indigo, fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List> _getResult() async {
    return await Api().fetch('exit_poll/result');
  }

  @override
  void initState() {
    super.initState();
    _candidateList = _getResult();
  }
}

