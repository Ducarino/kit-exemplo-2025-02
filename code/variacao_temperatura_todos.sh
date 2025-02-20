# calcula a variação de temperatura para todos os paises

echo "variacao_C_por_ano,pais"

for arquivo in dados/temperatura/a*.csv
do
	python ($dirname $0)/variacao_temperatura.py $arquivo
done