#!/bin/bash

XUBAPPINIT=/usr/share/xubapp/xubapp
XUBAPPAVS=/usr/share/xubapp/xubapp-avs
XUBAPPPNC=/usr/share/xubapp/xubapp.sh
XUBAPPADG=/usr/share/xubapp/xubapp-addrepgpg
XUBAPPCP=/usr/share/xubapp/xubapp-compilacoes
XUBAPPMT=/usr/share/xubapp/xubapp-multimedia
XUBAPPOPT=/usr/share/xubapp/xubapp-opcional
XUBAPPUPG=/usr/share/xubapp/xubapp-upgrade
CXUBAG=/var/cache/xubapp-ag
CXUBUPG=/var/cache/xubapp-upg
CXUBCM=/var/cache/xubapp-cm
CXUBMC=/var/cache/xubapp-mc
CXUBOP=/var/cache/xubapp-op
CREPGPG=/var/cache/addgpg

if [ -e $XUBAPPINIT ]
		then
###Inicio addgpg
if [ -e $CREPGPG ]
			then
addgpg (){
	clear
	echo -e '\n Menu principal - Adicionar GPG e Repositorios ao sistema.\n'
	echo -e '\n Este e o menu principal, onde podemos primeiramente adicionar os repositorios
	necessarios e/ou pular para as proximas etapas respectivas.
	Ao escolher a primeira etapa "Adicionar Repositorios",'
	echo -e '\b Ira ser adicionado os seguintes repositorios principais:'
	echo -e '\b Oracle VM VirtualBox. Maquina Virtual.'
	echo -e '\b Depôt MultiSystem. Criador multiboot usb.'
	echo -e '\b videolan. Dependências para media.'
	echo -e '\b Google Chrome e talkplugin. Navegador e plugin do Google.'
	echo -e '\b Remastersys. Programa para backup e remasterizacao do sistema.'
	echo -e '\b Ubuntu Cambrium. Complemento para os repositorios padroes do sistema.'
	echo -e '\b Wine. Para suporte a arquivos/programas Microsoft\n\n'
	echo -e '\b Adicionar Repositorios (A)'
	echo -e '\b Apenas fazer um upgrade (U)'
	echo -e '\b Pular para a etapa, "Compilacao e Manutencao" (C)'
	echo -e '\b Pular para a etapa, "Multimedia e Codecs" (M)'
	echo -e '\b Pular para a etapa, "Aplicativos Opcionais" (O)'
	echo -e '\b Sair da configuracao (Q)'
read opcao
case $opcao in
	A|a)
	sudo sh -c 'echo -e ""' > $CXUBAG
	Adicionar ;;
	U|u)
	sudo sh -c 'echo -e ""' > $CXUBUPG
	Upgrade ;;
	C|c)
	sudo sh -c 'echo -e ""' > $CXUBCM
	Compilacao ;;
	M|m)
	sudo sh -c 'echo -e ""' > $CXUBMC
	MultimediaCodecs ;;
	O|o)
	sudo sh -c 'echo -e ""' > $CXUBOP
	Opcionais ;;
	Q|q) clear ; Sair ;;
	*) "Opcao invalida" ; echo ; addgpg ;;
esac
}
###Inicio Adicionar
Adicionar (){
if [ -e $CXUBAG ]
			then
		if [ -e $XUBAPPADG ]
				then
	clear
	echo -e '\n Adicionar repositorios...'
	echo -e '\b Espere 30 segundos ou aperte "Enter".'
	read -t 30
	$XUBAPPADG
				else
	echo -e 'Nao foi possivel executar a acao para adicionar repositorios!'
	echo -e 'Voltando ao menu principal...'
	read -t 30
	addgpg
		fi
			else
	clear
	echo -e "Nao ha como executar esta acao!"
	echo -e "Voltando ao menu principal..."
	read -t 30
	addgpg
fi
}
###Fim Adicionar

###Inicio Upgrade
Upgrade (){
if [ -e $CXUBUPG ]
			then
		if [ -e $XUBAPPUPG ]
				then
	clear
	echo -e '\n Fazer upgrade do sistema...'
	echo -e '\b Espere 30 segundos ou aperte "Enter".'
	read -t 30
	$XUBAPPUPG
				else
	echo -e 'Nao foi possivel executar upgrade do sistema!'
	echo -e 'Voltando ao menu principal...'
	read -t 30
	addgpg
		fi
			else
	clear
	echo -e "Nao ha como executar esta acao!"
	echo -e "Voltando ao menu principal..."
	read -t 30
	addgpg
fi
}
###Fim Upgrade

###Inicio Compilacao
Compilacao (){
if [ -e $CXUBCM ]
			then
		if [ -e $XUBAPPCP ]
				then
	$XUBAPPCP
				else
	echo -e 'Nao foi possivel executar menu compilacoes!'
	echo -e 'Voltando ao menu principal...'
	read -t 30
	addgpg
		fi
			else
	clear
	echo -e "Nao ha como executar esta acao!"
	echo -e "Voltando ao menu principal..."
	read -t 30
	addgpg
fi
}
###Fim Compilacao

###MultimediaCodecs Inicio
MultimediaCodecs (){
if [ -e $CXUBMC ]
			then
		if [ -e $XUBAPPMT ]
				then
	$XUBAPPMT
				else
	echo -e 'Nao foi possivel executar menu multimedia!'
	echo -e 'Voltando ao menu principal...'
	read -t 30
	addgpg
		fi
			else
	clear
	echo -e "Nao ha como executar esta acao!"
	echo -e "Voltando ao menu principal..."
	read -t 30
	addgpg
fi
}
###MultimediaCodecs FIM

###Opcionais Inicio
Opcionais (){
if [ -e $CXUBOP ]
			then
		if [ -e $XUBAPPOPT ]
				then
	$XUBAPPOPT
				else
	echo -e 'Nao foi possivel executar menu opcionais!'
	echo -e 'Voltando ao menu principal...'
	read -t 30
	addgpg
		fi
			else
	clear
	echo -e "Nao ha como executar esta acao!"
	echo -e "Voltando ao menu principal..."
	read -t 30
	addgpg
fi
}
###Opcionais FIM

Sair (){
	echo -e '\n Saindo da configuracao...'
	echo -e '\b Espere 30 segundos ou aperte "Enter".'
	read -t 30
	exit 0
}

addgpg
			else
	echo -e 'Nao foi possivel acessar o menu principal!'
	echo -e 'Saindo do configurador...'
	read -t 10
	exit 0
fi
######FIM addgpg

		else
	echo -e 'Servico xubapp indisponivel!'
fi
