# Formato geral de um Makefile
#
# alvo: pre-requisito1 pre-requisito2 pre-requisito3 ...
# 	comandos que usam os pre-requisitos para gerar o alvo

all: resultados/variacao_temperatura resultados/numero_de_dados.txt figuras/variacao_temperatura.png
	# Nenhum comando, o "all" é um alvo fictício
	
clean: 
	rm -r -f resultados dados figuras
	
resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt
	
dados/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados
	
resultados/variacao_temperatura: code/variacao_temperatura_todos dados/temperature-data.zip 
	mkdir -p resultados
	bash code/variacao_temperatura_todos.sh > resultados/variacao_temperatura.csv
		
figuras/variacao_temperatura.png: code/plota_dados.py resultados/variacao_temperatura.csv
	mkdir -p figuras
	python code/plota_dados.py resultados/variacao_temperatura.csv figuras/variacao_temperatura.png