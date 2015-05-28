#Exercício 3 - SRCR

#se necessário instalar...
#install.packages("neuralnet")
#install.packages("hydroGOF")
#Usar:
library("neuralnet")
library(hydroGOF);


#ler dataset de um ficheiro txt
#header é para informar que a 1º linha é o "nome" da coluna
#sep é o separador, que no caso é a virgula
#dec é o caracter dos decimais, no caso o ponto
#Rafa : D:\\Rafa\\Escola\\GitHub\\SRCR-Exercicio3\\exercicio3.txt
#5 níveis de fadiga exercicio3.csv
#2 níveis de fadiga exercicio3-fadigas.csv
dataset <- read.csv("D:\\Rafa\\Escola\\GitHub\\SRCR-Exercicio3\\exercicio3.csv",
                     header=TRUE,
                     sep=";",
                     dec=".")
#mostrar a "cabeça" do dataset
#head(dados)

#extrair 800 casos do dataset para um novo datasete que será usado para treinar a rede neuronal 
trainset <- dataset[1:600, ]

## extrair as restantes entradas do dataset para um dataset que sera usado para testar a redeneuronal
testset <- dataset[601:840, ]

#medir o tempo
tempo <- proc.time()

#criar a rede
rede<-neuralnet(FatigueLevel ~ KDTMean+MAMean+MVMean+TBCMean+DDCMean+DMSMean+AEDMean+ADMSLMean,
                trainset,
                hidden=c(30,20),
                threshold=0.01)

#mostrar a rede
plot(rede)

#mostrar o tempo
proc.time() - tempo

#imprimir o erro
print(rede$result.matrix)

## definir variaveis de input para teste   
temp_test <- subset(testset,select = c("KDTMean","MAMean","MVMean","TBCMean","DDCMean","DMSMean","AEDMean","ADMSLMean"))

#correr os  testes na rede
rede.results<-compute(rede,temp_test)

#imprimir resultados
results <- data.frame(actual = testset$FatigueLevel, prediction = rede.results$net.result)

#calcular o RMSE
rmse(c(testset$FatigueLevel),c(results$prediction))