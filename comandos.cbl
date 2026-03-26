       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXEMPLO-COMANDOS-OTIMIZADO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      * Variáveis de controle
       01 I           PIC 9 VALUE 0.
       01 CONTADOR    PIC 9 VALUE 1.

      * Variáveis de usuário
       01 NOME        PIC A(20) VALUE SPACES.
       01 IDADE       PIC 99 VALUE 0.

      * Variáveis para operações
       01 A           PIC 99 VALUE 5.
       01 B           PIC 99 VALUE 2.
       01 TOTAL       PIC 9V99 VALUE 0.
       01 RESULTADO   PIC 9V99 VALUE 0.

       PROCEDURE DIVISION.

      * =========================
      * TÍTULO
       MAIN-PROGRAM.
           DISPLAY "========================================".
           DISPLAY "             COMANDOS COBOL             ".
           DISPLAY "========================================".

           PERFORM LOOP-VARYING
           PERFORM ATRIBUICAO
           PERFORM OPERACOES-ARITMETICAS
           PERFORM CONDICAO
           PERFORM LOOP-SIMPLES

           DISPLAY "FIM DO PROGRAMA.".
           STOP RUN.

      * =========================
      * LOOP COM VARYING
       LOOP-VARYING.
           DISPLAY "LOOP COM VARYING:".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "VALOR: " I
           END-PERFORM.

      * =========================
      * ATRIBUIÇÃO (MOVE)
       ATRIBUICAO.
           DISPLAY "ATRIBUICAO:".
           MOVE "Maria" TO NOME.
           MOVE 25 TO IDADE.
           DISPLAY "NOME: " NOME.
           DISPLAY "IDADE: " IDADE.

      * =========================
      * OPERAÇÕES ARITMÉTICAS
       OPERACOES-ARITMETICAS.
           DISPLAY "OPERACOES:".

           ADD 5 TO IDADE.
           DISPLAY "IDADE + 5: " IDADE.

           ADD A B GIVING TOTAL.
           DISPLAY "A + B = " TOTAL.

           SUBTRACT 2 FROM IDADE.
           DISPLAY "IDADE - 2: " IDADE.

           MULTIPLY A BY B GIVING RESULTADO.
           DISPLAY "A * B = " RESULTADO.

           DIVIDE A BY B GIVING RESULTADO.
           DISPLAY "A / B = " RESULTADO.

      * =========================
      * CONDIÇÃO (IF)
           CONDICAO.
           DISPLAY "CONDICAO:".
           IF IDADE > 18
               DISPLAY "Maior de idade"
           ELSE
               DISPLAY "Menor de idade"
           END-IF.


      * LOOP SIMPLES
       LOOP-SIMPLES.
           DISPLAY "LOOP SIMPLES:".
           PERFORM 5 TIMES
               DISPLAY "A repetir..."
           END-PERFORM.
