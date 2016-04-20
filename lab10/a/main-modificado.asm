; -------------------------------------------------------------------
; Programa principal do Monitor Batch Simples (MBS)
; -------------------------------------------------------------------

; Coloque aqui os símbolos importados
; -------------------------------------------------------------------
DUMPER          <
DUMP_INI        <
DUMP_TAM        <
DUMP_UL         <
DUMP_BL         <
DUMP_EXE        <
LOADER      <
LOADER_UL   <

; ...

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

;CONSTANTES EXTRAS
dois		K	/0002
tres		K	/0003
quatro		K	/0004
cinco		K	/0005
BARRAS          K       /2F2F
JB		K	/4A42
DU		K	/4455
LO		K	/4C4F
DIFERENCA	K	/07FA	
BB		K	/4242
FINAL		K	/2F2A
ESPACO		K	/0A0A
BRANCOS		K	/2020
EX		K	/4558
test		K	/f909
ARMAZENA	K	/0000

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



;INI             K       /0000

; ==================================================================
INI             GD	/0300
                -       BARRAS
                JZ      CONTINUA
                JP	ERRO1
CONTINUA	GD	/0300
		-	JB
		JZ	CONTINUA2
ERRO1		LD	ONE
		OS	/00EE
		JP	FIM
CONTINUA2	GD	/0300
		-	ESPACO
		JZ	CONTINUA3
		JP	ERRO1
CONTINUA3	GD	/0300
		-	BARRAS
		JZ	CONTINUA4
		JP	ERRO2
CONTINUA4	GD	/0300
		-	DU
		JZ	CONTINUADUMP
		-	DIFERENCA ; APOS TESTAR DU BASTA TESTAR SE ENTRADA-(LO-DU)==0.
		JZ	CONTINUALOAD
		-	test
		JZ	CONTINUAEXE
ERRO2		LD	dois
		OS	/00EE
		JP	FIM
CONTINUALOAD	GD	/0300
		-	ESPACO
		JZ	CONTINUARG
		JP	ERRO2
CONTINUARG	GD	/0300
		MM	CH_IN_A
		GD	/0300
		MM	CH_IN_B
		SC	CHTOI
		MM	LOADER_UL
		SC	LOADER
		GD	/0300
		-	ESPACO
		JZ	TESTASEFIM
ERRO3		LD	tres
		OS	/00EE
		JP	FIM	
CONTINUADUMP	GD	/0300
		-	ESPACO
		JZ	DUMPARG1
		JP	ERRO2
DUMPARG1	GD	/0300
		MM	CH_IN_A
		GD	/0300
		MM	CH_IN_B
		SC	CHTOI
		MM	DUMP_BL
		GD	/0300
		-	BRANCOS
		JZ	DUMPARG2
		JP	ERRO3
DUMPARG2	GD	/0300
		MM	CH_IN_A
		GD	/0300
		MM	CH_IN_B
		SC	CHTOI
		MM	DUMP_INI
		GD	/0300
		-	BRANCOS
		JZ	DUMPARG3
		JP	ERRO3
DUMPARG3	GD	/0300
		MM	CH_IN_A
		GD	/0300
		MM	CH_IN_B
		SC	CHTOI
		MM	DUMP_TAM
		GD	/0300
		-	BRANCOS
		JZ	DUMPARG4
		JP	ERRO3
DUMPARG4	GD	/0300	
		MM	CH_IN_A
		GD	/0300
		MM	CH_IN_B
		SC	CHTOI
		MM	DUMP_EXE
		GD	/0300
		-	BRANCOS
		JZ	DUMPARG5
		JP	ERRO3
DUMPARG5	GD	/0300
		MM	CH_IN_A
		GD	/0300
		MM	CH_IN_B
		SC	CHTOI
		MM	DUMP_UL
		SC	DUMPER
		GD	/0300
		-	ESPACO
		JZ	TESTASEFIM
		JP	ERRO3
CONTINUAEXE	GD	/0300
		-	ESPACO
		JZ	EXEARG
		JP	ERRO2
EXEARG		GD	/0300
		MM	CH_IN_A
		GD	/0300
		MM	CH_IN_B
		SC	CHTOI
		MM	ARMAZENA
		-	/00FF
		JZ	CONTINUAEX
		JN	CONTINUAEX
ERRO5		LD	cinco
		OS	/00EE
		JP	FIM
CONTINUAEX	LD	ARMAZENA
		MM	LOADER_UL ;será eliminado apos corrigir java
		SC	LOADER	  ; será eliminado apos corrigir java
		+	ZERO
		MM	PROXINST
PROXINST	K	/0000
		GD	/0300
		-	ESPACO
		JZ	TESTASEFIM
		JP	ERRO3
TESTASEFIM	GD	/0300
		-	FINAL
		JZ	DEUCERTO
		LD	quatro
		OS	/00EE
		JP	FIM
DEUCERTO	LD	ZERO
		OS	/00EE
; ==================================================================

FIM             HM      FIM   ; Fim do programa

# MAIN
