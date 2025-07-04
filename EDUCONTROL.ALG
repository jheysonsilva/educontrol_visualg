Algoritmo "EduControl"
// ---------------------------------------------
// Autor: Jheyson Silva Siqueira
// Objetivo: Sistema de controle de alunos com cadastro, notas, m�dias e estat�sticas
// Linguagem: Visualg 3.0.7.0
// Data: Junho de 2025
// ---------------------------------------------

Var
   nomeAlunos: vetor [1..5] de caractere
   notas: vetor [1..5, 1..2] de real   // Matriz 5x2 para armazenar 2 notas de 5 alunos
   medias: vetor [1..5] de real        // Vetor para as m�dias dos alunos

   i, j, opcao: inteiro
   maiorMedia, menorMedia, somaMedias, mediaTurma: real
   posMaior, posMenor: inteiro
   novoNome: caractere

// -------------------------------
// Fun��o que calcula a m�dia de duas notas
// -------------------------------
funcao CalcularMedia(n1: real; n2: real): real
inicio
   retorne (n1 + n2) / 2
fimfuncao

// -------------------------------
// Procedimento que mostra a situa��o final de cada aluno
// -------------------------------
procedimento MostrarSituacao()
inicio
   escreval("")
   escreval("===============================")
   escreval("   Situa��o Final dos Alunos   ")
   escreval("===============================")

   para i de 1 ate 5 faca
      escreval("Aluno: ", nomeAlunos[i])
      escreval("M�dia: ", medias[i]:4:2)

      se (medias[i] >= 7) entao
         escreval("Situa��o: Aprovado")
      senao
         se (medias[i] >= 5) entao
            escreval("Situa��o: Recupera��o")
         senao
            escreval("Situa��o: Reprovado")
         fimse
      fimse

      escreval("-------------------------------")
   fimpara
fimprocedimento

// -------------------------------
// Procedimento para mostrar estat�sticas gerais
// -------------------------------
procedimento MostrarEstatisticas()
inicio
   maiorMedia <- medias[1]
   menorMedia <- medias[1]
   posMaior <- 1
   posMenor <- 1
   somaMedias <- 0

   para i de 1 ate 5 faca
      se (medias[i] > maiorMedia) entao
         maiorMedia <- medias[i]
         posMaior <- i
      fimse

      se (medias[i] < menorMedia) entao
         menorMedia <- medias[i]
         posMenor <- i
      fimse

      somaMedias <- somaMedias + medias[i]
   fimpara

   mediaTurma <- somaMedias / 5

   escreval("")
   escreval("======== Estat�sticas da Turma ========")
   escreval("Maior m�dia: ", maiorMedia:4:2, " (", nomeAlunos[posMaior], ")")
   escreval("Menor m�dia: ", menorMedia:4:2, " (", nomeAlunos[posMenor], ")")
   escreval("M�dia geral da turma: ", mediaTurma:4:2)
   escreval("=======================================")
fimprocedimento

// -------------------------------
// Procedimento para editar o nome de um aluno
// -------------------------------
procedimento EditarNome()
inicio
   escreval("")
   escreval("===== Editar Nome de Aluno =====")
   para i de 1 ate 5 faca
      escreval(i, " - ", nomeAlunos[i])
   fimpara
   escreva("Digite o n�mero do aluno que deseja renomear (1 a 5): ")
   leia(i)

   se (i >= 1) e (i <= 5) entao
      escreva("Digite o novo nome para o aluno ", i, ": ")
      leia(novoNome)

      // Valida��o simples sem usar 'comprimento'
      se novoNome <> "" entao
         nomeAlunos[i] <- novoNome
         escreval("Nome alterado com sucesso!")
      senao
         escreval("Nome inv�lido. Nenhuma altera��o feita.")
      fimse
   senao
      escreval("N�mero inv�lido.")
   fimse
fimprocedimento

// -------------------------------
// In�cio do programa principal
// -------------------------------
Inicio

   // Etapa 1: Cadastro inicial dos nomes
   para i de 1 ate 5 faca
      escreva("Digite o nome do aluno ", i, ": ")
      leia(nomeAlunos[i])
   fimpara

   // Etapa 2: Menu com repeti��o
   repita
      escreval("")
      escreval("======================================")
      escreval("            MENU EDUCONTROL           ")
      escreval("======================================")
      escreval("1 - Mostrar alunos cadastrados")
      escreval("2 - Cadastrar notas e mostrar situa��o")
      escreval("3 - Mostrar estat�sticas da turma")
      escreval("4 - Editar nome de um aluno")
      escreval("5 - Sair do sistema")
      escreval("======================================")
      escreva("Escolha uma op��o (1 a 5): ")
      leia(opcao)

      // Valida��o da op��o
      enquanto (opcao < 1) ou (opcao > 5) faca
         escreval("Op��o inv�lida. Tente novamente.")
         escreva("Escolha uma op��o (1 a 5): ")
         leia(opcao)
      fimenquanto

      escolha opcao
         caso 1
            escreval("")
            escreval("===== Alunos Cadastrados =====")
            para i de 1 ate 5 faca
               escreval(i, " - ", nomeAlunos[i])
            fimpara

         caso 2
            para i de 1 ate 5 faca
               escreval("")
               escreval("Digite as notas de ", nomeAlunos[i])

               // Nota 1
               repita
                  escreva("Nota 1: ")
                  leia(notas[i,1])
                  se (notas[i,1] < 0) ou (notas[i,1] > 10) entao
                     escreval("Nota inv�lida. Digite entre 0 e 10.")
                  fimse
               ate (notas[i,1] >= 0) e (notas[i,1] <= 10)

               // Nota 2
               repita
                  escreva("Nota 2: ")
                  leia(notas[i,2])
                  se (notas[i,2] < 0) ou (notas[i,2] > 10) entao
                     escreval("Nota inv�lida. Digite entre 0 e 10.")
                  fimse
               ate (notas[i,2] >= 0) e (notas[i,2] <= 10)

               // Calcular m�dia
               medias[i] <- CalcularMedia(notas[i,1], notas[i,2])
            fimpara

            MostrarSituacao()

         caso 3
            MostrarEstatisticas()

         caso 4
            EditarNome()

         caso 5
            escreval("Saindo do sistema... At� logo!")
      fimescolha

   ate (opcao = 5)

Fimalgoritmo
