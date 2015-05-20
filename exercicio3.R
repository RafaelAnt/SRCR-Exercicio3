#Exercício 3 - SRCR

library("neuralnet")

#ler dataset de um ficheiro csv
#header é para informar que a 1º linha é o "nome" da coluna
#sep é o separador, que no caso é o Tab
#dec é o caracter dos decimais
trainset <- read.csv("D:\\LEI\\3º Ano\\2º Semestre\\SRCR\\Aulas R\\Dados Ficha 10\\ficha10.normalizado.txt",
                     header=TRUE,sep="\t",dec=".")
#mostrar a "cabeça" do dataset
head(trainset)

#criar a rede
creditnet<-neuralnet(Avaliacao ~ Vencimento+Habitacao+Automovel+Cartao,
                     trainset,hidden=c(5),threshold=0.01)

#mostrar a rede
plot(creditnet)

#criar uma matriz de teste
test<-data.frame(Vencimento=0.4,Habitacao=0.2,Automovel=0.4,Cartao=0.1)
test[2,]<-data.frame(Vencimento=0.7,Habitacao=0.4,Automovel=0.55,Cartao=0.1)

#correr os  testes na rede
creditnet.results<-compute(creditnet,test)

#imprimir respostas
print(round(creditnet.results$net.result))
print(creditnet.results$net.result)