      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONVERTE_TRES_ENDERECOS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A                  PIC 9 VALUE 2.
       01 B                  PIC 9 VALUE 3.
       01 C                  PIC 9 VALUE 1.
       01 D                  PIC 9 VALUE 4.

       01 T1                 PIC 99.
       01 T2                 PIC 99.
       01 V                  PIC 99.      *> Resultado final (x)

       PROCEDURE DIVISION.
       DISPLAY "=== Conversao para Codigo de Tres Enderecos ===".
       DISPLAY "Expressao original: x = a + b * d - c".
       DISPLAY "Valores: a=2, b=3, c=1, d=4".
       DISPLAY " ".

      *> t1 = b * d
       COMPUTE T1 = B * D.
       DISPLAY "t1 = b * d          -> t1 = " T1.

      *> x0 = a + t1 - c
       COMPUTE V = A + T1 - C.
       DISPLAY "x0 = a + t1 - c     -> x0 = " V.

      *> t2 = a + t1
       COMPUTE T2 = A + T1.
       DISPLAY "t2 = a + t1         -> t2 = " T2.

      *> x2 = t2 - c
       COMPUTE V = T2 - C.
       DISPLAY "x2 = t2 - c         -> x2 = " V.

       DISPLAY " ".
       DISPLAY "Programa finalizado.".
       STOP RUN.
