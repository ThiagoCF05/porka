// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function atualizaContador(YY,MM,DD,HH,MI,saida) {
	var SS = 00; //Segundos
	var hoje = new Date(); //Dia
	var futuro = new Date(YY,MM-1,DD,HH,MI,SS); //Data limite do contador

	var ss = parseInt((futuro - hoje) / 1000); //Determina a quantidade total de segundos que faltam
	var mm = parseInt(ss / 60); //Determina a quantidade total de minutos que faltam
	var hh = parseInt(mm / 60); //Determina a quantidade total de horas que faltam
	var dd = parseInt(hh / 24); //Determina a quantidade total de dias que faltam

	ss = ss - (mm * 60); //Determina a quantidade de segundos
	mm = mm - (hh * 60); //Determina a quantidade de minutos
	hh = hh - (dd * 24); //Determina a quantidade de horas

	//O bloco abaixo descreve monta o que vai ser escrito na tela
	var faltam = '';
	faltam += (dd && dd > 1) ? dd+' dias, ' : (dd==1 ? '1 dia, ' : '');
	faltam += (toString(hh).length) ? hh+':' : '';
	faltam += (toString(mm).length) ? mm+':' : '';
	faltam += ss;

	if (dd+hh+mm+ss > 0) {
		document.getElementById(saida).innerHTML = faltam;//Insere o conteudo da variável faltam na página.
		setTimeout(function(){atualizaContador(YY,MM,DD,HH,MI,saida)},1000);//Reinicia a função a cada um segundo
	}
	else {
		document.getElementById(saida).innerHTML = '';
		setTimeout(function(){atualizaContador(YY,MM,DD,HH,MI,saida)},1000);
	}
}
