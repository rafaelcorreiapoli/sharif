; -------------------------------------------------------------------
; Programa principal do Monitor Batch Simples (MBS)
; -------------------------------------------------------------------

LOADER <
LOADER_UL <
DUMPER <
DUMP_INI <
DUMP_TAM <
DUMP_UL <
DUMP_BL <
DUMP_EXE <

; Origem relocável
                &       /0000

MAIN            JP      INI      ; salta para o início do programa
UL              K       /0000    ; parâmetro: UL onde está o arquivo de batch

; -------------------------------------------------------------------
; Subrotina: UNPACK
; Extrai os bytes de uma word contida no acumulador, colocando-os
; em dois endereços da memória.
;
; Exemplo: dada a word XYZT no acumulador, ao final da execução,
; UNP_B1="00XY" e UNP_B2="00ZT".
; -------------------------------------------------------------------

; Parâmetros
WORD            $       /0001       ; Word de entrada
UNP_B1          $       /0001       ; Byte mais significativo
UNP_B2          $       /0001       ; Byte menos significativo

; Constantes
SHIFT           K       /0100
CH_0            K       /0030
CH_F            K       /0046
X_INI           K       /003A
X_END           K       /0041
X_DIFF          K       /0007
ONE             K       /0001
MINUS_1         K       /FFFF
ZERO            K       /0000
EIGHT           K       /1000
FOUR            K       /0100
TWO             K       /0010

; Corpo da subrotina
UNPACK          $       /0001
                MM      WORD        ; Carrega word. Primeiramente faremos unpack de B2
                *       SHIFT       ; Desloca os bytes para remover 2 primeiros hex
                SC      RSHIFT2     ; Desloca os bytes menos significativos pro seu lugar
                MM      UNP_B2      ; Salva resultado
                LD      WORD        ;
                SC      RSHIFT2     ;
                MM      UNP_B1      ;
                RS      UNPACK      ; Retorna

; -------------------------------------------------------------------
; Subrotina: RSHIFT2
; Faz um right shift (<) duas vezes do valor do acumulador
; -------------------------------------------------------------------

; Constantes
FIX             K       /8000
REFIX           K       /0080
; Corpo da subrotina
RSHIFT2         $       /0001
                JN      NEG         ; O número é negativo
                /       SHIFT       ; Retorna os 2 bytes à posição inicial
                JP      FIM-RS      ; Vai para final de RSHIFT2
NEG             -       FIX         ; Fix do shift em número negativo
                /       SHIFT       ; Shift
                +       REFIX       ; Fix para voltar número tirado
FIM-RS          RS      RSHIFT2     ; Retorno

; -------------------------------------------------------------------
; Subrotina: IS_HEX
; -------------------------------------------------------------------

  ;; Parâmetros
S_HEX           $       /0001
  ;; Corpo da subrotina
IS_HEX          $       /0001
                MM      S_HEX
  ;; Verifica se < '0'
                -       CH_0
                JN      NOT_HEX
  ;; Verifica se > 'f'
                LD      S_HEX
                -       CH_F
                -       ONE ; we wanna include 'f'
                JN      MIGHTB
  ;; Não é hex. Retorna -1.
NOT_HEX         LD      MINUS_1
                RS      IS_HEX
  ;; Incrementa CH_F decrementado e verifica se é caractere especial.
MIGHTB          LD      S_HEX
                -       X_INI
                JN      YES_HEX
                -       X_DIFF
                JN      NOT_HEX
                LD      S_HEX
                -       X_DIFF
                RS      IS_HEX
YES_HEX         LD      S_HEX
                RS      IS_HEX

; -------------------------------------------------------------------
; Subrotina: CHTOI
; Converte uma word em hexa para um número inteiro.
;
; Exemplo: CHTOI("0010") = 0010 (i.e., 16 em decimal)
; -------------------------------------------------------------------

  ;; Parâmetros
CH_ANS          $       /0001        ; Variável para guardar resultado
CH_IN_A         $       /0001        ; 2 bytes mais significativos (em ASCII)
CH_IN_B         $       /0001        ; 2 bytes menos signicativos (em ASCII)

  ;; Corpo da subrotina
CHTOI           $       /0001
  ;; Zera CH_ANS
                LD      ZERO
                MM      CH_ANS
  ;; Unpack primeira palavra
                LD      CH_IN_A
                MM      WORD
                SC      UNPACK
  ;; Processa primeira palavra
  ;; Processa primeiro byte
                LD      UNP_B1
                SC      IS_HEX
                JN      CH_RET
                -       CH_0
                *       EIGHT
                MM      CH_ANS
  ;; Processa segundo byte
                LD      UNP_B2
                SC      IS_HEX
                JN      CH_RET
                -       CH_0
                *       FOUR
                +       CH_ANS
                MM      CH_ANS
  ;; Unpack segunda palavra
                LD      CH_IN_B
                MM      WORD
                SC      UNPACK
  ;; Processa segunda palavra
  ;; Processa primeiro byte
                LD      UNP_B1
                SC      IS_HEX
                JN      CH_RET
                -       CH_0
                *       TWO
                +       CH_ANS
                MM      CH_ANS
  ;; Processa segundo byte
                LD      UNP_B2
                SC      IS_HEX
                JN      CH_RET
                -       CH_0
                +       CH_ANS
  ;; Valor da resposta está no acumulador!
CH_RET          RS      CHTOI
; ---------------------------------------------------------
BARRABARRA      K '//
BARRASOZINHA    K /002F
EOL             K /000A
JB              K 'JB
DU              K 'DU
LO              K 'LO
EX              K 'EX
END_CMD         K '/*
NLNL            K /0A0A
METHD_TMP       K /0

INI             GD /300
                -  BARRABARRA
                JZ OK_1
                LV /1
                OS /0EE
OPARUIM         HM OPARUIM
OK_1            GD /300
                -  JB
                JZ PRE_LOOP_READ_CMD
                LV /1
                OS /0EE
PARAPARA        HM PARAPARA

PRE_LOOP_READ_CMD GD /300
                -  NLNL
                JZ LOOP_READ_CMD
                LV /1
                OS /0EE
AIMDS           HM AIMDS

LOOP_READ_CMD   GD /300
                -  BARRABARRA
                JZ CMD_OK
                +  BARRABARRA
                -  END_CMD
                JZ OK_RETURN
; começa com barra ou vazio => ERR:END, senão ERR:CMD
                +  END_CMD
                /  SHIFT
                -  BARRASOZINHA
                JZ FIM_INVALIDO
                +  BARRASOZINHA
                -  EOL
                JZ FIM_INVALIDO
                LV /2
                OS /0EE
CMD_INVALIDO    HM CMD_INVALIDO
FIM_INVALIDO    LV /4
                OS /0EE
DEUPAU          HM DEUPAU
CMD             K /0000
CMD_OK          GD /300
                MM CMD

                GD /300
                -  NLNL
                JZ OK_CMD
                LV /2
                OS /0EE
FAIOUAQUI       HM FAIOUAQUI

OK_CMD          LD CMD
                -  DU
                JZ DO_DU
                +  DU
                -  LO
                JZ DO_LO
                +  LO
                -  EX
                JZ DO_EX
                ; Comando não existe
                LV /2
                OS /0EE
BATATAOI        HM BATATAOI
OK_RETURN       LV /0
                OS /0EE
DONEDONE        HM DONEDONE
LOAD_ARG        K /0000
                GD /300
                MM CH_IN_A
                /  SHIFT
                SC IS_HEX
                LD CH_IN_A
                *  SHIFT
                /  SHIFT
                SC IS_HEX
                -  MINUS_1
                JZ DU_ERR
                GD /300
                MM CH_IN_B
                /  SHIFT
                SC IS_HEX
                LD CH_IN_B
                *  SHIFT
                /  SHIFT
                SC IS_HEX
                -  MINUS_1
                JZ DU_ERR
                SC CHTOI
                RS LOAD_ARG

SPACE           K /2020
LOAD_BLANK      K /0000
                GD /300
                -  SPACE
                JZ BLANK_OK1
                JP DU_ERR
BLANK_OK1       RS LOAD_BLANK

LOAD_NL         K /0000
                GD /300
                -  NLNL
                JZ NL_OK1
                JP DU_ERR
NL_OK1          RS LOAD_NL

DO_DU           SC LOAD_ARG
                MM DUMP_BL
                SC LOAD_BLANK

                SC LOAD_ARG
                MM DUMP_INI
                SC LOAD_BLANK

                SC LOAD_ARG
                MM DUMP_TAM
                SC LOAD_BLANK

                SC LOAD_ARG
                MM DUMP_EXE
                SC LOAD_BLANK

                SC LOAD_ARG
                MM DUMP_UL
                SC LOAD_NL

                SC DUMPER
                JP LOOP_READ_CMD

DU_ERR          LV /3
                OS /0EE
BATATA          HM      BATATA

DO_LO           SC LOAD_ARG
                MM LOADER_UL
                SC LOAD_NL

                SC LOADER
                JP LOOP_READ_CMD

DO_EX           SC LOAD_ARG
                MM LOADER_UL
                SC LOAD_NL

                SC LOADER
READ_LINE       K  /F0DA       ; Lê última linha do arquivo
                OS /0EF
                JP LOOP_READ_CMD

FIM             HM      FIM   ; Fim do programa

# MAIN
