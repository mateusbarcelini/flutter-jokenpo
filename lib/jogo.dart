import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = const AssetImage('images/default.png');
  var _mensagem = 'Choose an option bellow';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['rock', 'paper', 'scissors'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    // Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case 'rock':
        setState(() {
          _imagemApp = const AssetImage('images/rock.png');
        });
        break;
      case 'paper':
        setState(() {
          _imagemApp = const AssetImage('images/paper.png');
        });
        break;
      case 'scissors':
        setState(() {
          _imagemApp = const AssetImage('images/scissors.png');
        });
        break;
    }

    //Validação do ganhador
    //Usuario Ganhador
    if ((escolhaUsuario == 'rock' && escolhaApp == 'scissors') || //
            (escolhaUsuario == 'scissors' && escolhaApp == 'paper') || //
            (escolhaUsuario == 'paper' && escolhaApp == 'rock') //
        ) {
      setState(() {
        _mensagem = 'Congrats!!! You WIN :)';
      });
      //App Ganhador
    } else if ((escolhaApp == 'rock' && escolhaUsuario == 'scissors') || //
            (escolhaApp == 'scissors' && escolhaUsuario == 'paper') || //
            (escolhaApp == 'paper' && escolhaUsuario == 'rock') //
        ) {
      setState(() {
        _mensagem = 'Oh! You lose :(';
      });
    } else {
      setState(() {
        _mensagem = 'Close, we draw ;)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'App choice',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('rock'),
                child: Image.asset(
                  'images/rock.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('paper'),
                child: Image.asset(
                  'images/paper.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('scissors'),
                child: Image.asset(
                  'images/scissors.png',
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
