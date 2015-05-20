#Exercício 3 - SRCR

#se necessário instalar...
#install.packages("neuralnet")

#Usar:
library("neuralnet")


#ler dataset de um ficheiro txt
#header é para informar que a 1º linha é o "nome" da coluna
#sep é o separador, que no caso é a virgula
#dec é o caracter dos decimais, no caso o ponto
#Rafa : D:\\Rafa\\Escola\\GitHub\\SRCR-Exercicio3\\exercicio3.txt
trainset <- read.csv("D:\\Rafa\\Escola\\GitHub\\SRCR-Exercicio3\\exercicio3.txt",
                     header=TRUE,sep=",",dec=".")
#mostrar a "cabeça" do dataset
#head(trainset)

#criar a rede
creditnet<-neuralnet(FatigueLevel ~ KDTMean+MAMean+MVMean+TBCMean+DDCMean+DMSMean+AEDMean+ADMSLMean,
                     trainset,hidden=c(5),threshold=0.01)

#mostrar a rede
plot(creditnet)

#criar uma matriz de teste
test<-data.frame(KDTMean=0.061230881311235, #Suposto ser 1
                 MAMean=0.861594433682678,
                 MVMean=0.827884249001262,
                 TBCMean=-0.72964333684447,
                 DDCMean=-0.216083140977348,
                 DMSMean=-0.95231460729886,
                 AEDMean=-0.032232906774237,
                 ADMSLMean=-0.7486575377275)

test[2,]<-data.frame(KDTMean=0.001747651084306, #Suposto ser 6
                     MAMean=0.097482878651944,
                     MVMean=0.115366961041514,
                     TBCMean=-0.07807993361726,
                     DDCMean=-0.064426638328348, 
                     DMSMean=-0.01281824370211,
                     AEDMean=-0.038354975497981,
                     ADMSLMean=0.0522370512802)

test[3,]<-data.frame(KDTMean=1,
                     MAMean=1,
                     MVMean=1,
                     TBCMean=1,
                     DDCMean=1, 
                     DMSMean=1,
                     AEDMean=1,
                     ADMSLMean=1)

test[4,]<-data.frame(KDTMean=-1,
                     MAMean=-1,
                     MVMean=-1,
                     TBCMean=-1,
                     DDCMean=-1, 
                     DMSMean=-1,
                     AEDMean=-1,
                     ADMSLMean=-1)
								

#correr os  testes na rede
creditnet.results<-compute(creditnet,test)

#imprimir respostas
print(round(creditnet.results$net.result))
print(creditnet.results$net.result)