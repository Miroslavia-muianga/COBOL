      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************


             IDENTIFICATION DIVISION.
             PROGRAM-ID. FIBONACCI.

            DATA DIVISION.
                WORKING-STORAGE SECTION.
              01 N            PIC 9(3) VALUE 0.
              01 I            PIC 9(3) VALUE 0.
              01 A            PIC 9(5) VALUE 0.
              01 B            PIC 9(5) VALUE 1.
              01 TEMP         PIC 9(5) VALUE 0.

           PROCEDURE DIVISION.
              MAIN-PROCEDURE.

            DISPLAY "Digite quantos termos deseja: ".
            ACCEPT N.

            DISPLAY "Sequencia de Fibonacci:".

            PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
                DISPLAY A
                MOVE B TO TEMP
                ADD A TO B
                MOVE TEMP TO A
            END-PERFORM

            STOP RUN.
            END PROGRAM FIBONACCI.
