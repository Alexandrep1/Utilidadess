import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilidades/src/app/app_widget.dart';
import 'package:utilidades/src/views/counter_cubit.dart';

void main() {

  /* 
-------------------------------------------------------

riverpod - é uma biblioteca de gereniamento de estado desenvolvida por Remi Rousselete (criador do provider).
eke foi criado para corrigir limitações do provider e oferecer uma abordagem mais robusta, segura e flexível.

vantagens
- segura em tempo de compilação: detecta erros mais cedo
- não depende de buildcontext
- testável e modular
- suporte nativo para providers assincronos, como futureProvider e streamProvider

-------------------------------------------------------

BloC - Business Logic Component
é um padrão de arquitetura que separa a lógica de negócios de interface
de usuário usando streams.
ele foi criado pelo google para facilitar o reuso da logica em varios widgets.

vantagens
- muito usado em apps corporativos
- força uma arquitetura bem definida
- baseado em streams  (fluxo de dados)

conceitos principais
- evento: entrada enviada pelo usuário
- state: saída do bloco
- bloco: recebe eventos e emite estados

para usar preciamos instalar o pacote flutter_bloc

bloc + cubit

cubit é uma versão mais simples e direta do bloc, sem eventos, voce apenas
chama metodos e emite estados diretamente


 */

  //runApp(myApp());

}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => CounterCubit(), child: CounterPage()),
    );
  }
}
