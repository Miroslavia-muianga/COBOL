IDENTIFICATION DIVISION.
       PROGRAM-ID. VALIDADOR-DETALHADO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NOME-IDENTIFICADOR           PIC X(30).
       01 NOME-IDENTIFICADOR-MAIUSCULO  PIC X(30).
       01 INDICE                       PIC 99.
       01 TAMANHO-DO-TEXTO             PIC 99.
       01 MENSAGEM-DE-ERRO             PIC X(60) VALUE SPACES.
       
       01 STATUS-VALIDACAO             PIC X VALUE 'S'.
           88 IDENTIFICADOR-E-VALIDO         VALUE 'S'.
           88 IDENTIFICADOR-E-INVALIDO       VALUE 'N'.

       01 CARACTERE-ATUAL              PIC X.
       01 CARACTERE-ANTERIOR           PIC X.

       PROCEDURE DIVISION.
           DISPLAY "================================================"
           DISPLAY "   ANALIZADOR LÉXICO DE IDENTIFICADORES COBOL   "
           DISPLAY "================================================"
           DISPLAY "Digite o identificador a ser analisado: "
           ACCEPT NOME-IDENTIFICADOR

      *Preparação: Converte e mede o texto
           MOVE FUNCTION UPPER-CASE(NOME-IDENTIFICADOR) 
             TO NOME-IDENTIFICADOR-MAIUSCULO

           MOVE 0 TO TAMANHO-DO-TEXTO
           INSPECT FUNCTION REVERSE(NOME-IDENTIFICADOR-MAIUSCULO)
           TALLYING TAMANHO-DO-TEXTO FOR LEADING SPACE
           COMPUTE TAMANHO-DO-TEXTO = 30 - TAMANHO-DO-TEXTO

      * REGRA 1: Texto Vazio
           IF TAMANHO-DO-TEXTO = 0
               SET IDENTIFICADOR-E-INVALIDO TO TRUE
               MOVE "ERRO: O identificador nao pode estar vazio." 
                 TO MENSAGEM-DE-ERRO
               GO TO FINALIZAR-PROGRAMA
           END-IF

      *--- REGRA 2: Primeiro Caractere (deve ser letra)
           IF NOME-IDENTIFICADOR-MAIUSCULO(1:1) NOT ALPHABETIC
               SET IDENTIFICADOR-E-INVALIDO TO TRUE
               MOVE "ERRO: Deve iniciar obrigatoriamente com uma letra." 
                 TO MENSAGEM-DE-ERRO
               GO TO FINALIZAR-PROGRAMA
           END-IF

      *--- REGRA 3: Percorrer o corpo do texto
           PERFORM VARYING INDICE FROM 1 BY 1 
               UNTIL INDICE > TAMANHO-DO-TEXTO OR IDENTIFICADOR-E-INVALIDO
               
               MOVE NOME-IDENTIFICADOR-MAIUSCULO(INDICE:1) 
                 TO CARACTERE-ATUAL

      * Caracteres Proibidos
               IF NOT (CARACTERE-ATUAL ALPHABETIC OR 
                       (CARACTERE-ATUAL >= '0' AND CARACTERE-ATUAL <= '9') OR 
                       CARACTERE-ATUAL = '-')
                   SET IDENTIFICADOR-E-INVALIDO TO TRUE
                   MOVE "ERRO: Caractere invalido encontrado: " 
                     TO MENSAGEM-DE-ERRO
                   STRING MENSAGEM-DE-ERRO CARACTERE-ATUAL 
                     DELIMITED BY SIZE INTO MENSAGEM-DE-ERRO
               END-IF

      * Hífens Consecutivos
               IF INDICE > 1 AND IDENTIFICADOR-E-VALIDO
                   MOVE NOME-IDENTIFICADOR-MAIUSCULO(INDICE - 1:1) 
                     TO CARACTERE-ANTERIOR
                   IF CARACTERE-ATUAL = '-' AND CARACTERE-ANTERIOR = '-'
                       SET IDENTIFICADOR-INVALIDO TO TRUE
                       MOVE "ERRO: Nao e permitido hifens seguidos (--)." 
                         TO MENSAGEM-DE-ERRO
                   END-IF
               END-IF
           END-PERFORM

      * REGRA 4: Último Caractere
           IF IDENTIFICADOR-E-VALIDO AND 
              NOME-IDENTIFICADOR-MAIUSCULO(TAMANHO-DO-TEXTO:1) = '-'
               SET IDENTIFICADOR-E-INVALIDO TO TRUE
               MOVE "ERRO: O identificador nao pode terminar com hifen." 
                 TO MENSAGEM-DE-ERRO
           END-IF.

       FINALIZAR-PROGRAMA.
           IF IDENTIFICADOR-E-VALIDO
               DISPLAY "SUCESSO: O identificador e valido!"
           ELSE
               DISPLAY MENSAGEM-DE-ERRO
           END-IF
           DISPLAY "========================================"
           STOP RUN.