; ================================================================================
@ /0000 
JP MAIN ; 0000 0300 - Jump para o programa principal
; ================================================================================
; Variáveis e constantes
; ================================================================================
OP    K /0000  ; 0010 0000 - Variável OPCODE (global) em hexadecimal
MNEM  K /0000  ; 0012 0000 - Variável MNEM (global) em hexadecimal
BYTE1 K /0000  ; 0024 0000 - Variável Byte1MNEM
BYTE2 K /0000  ; 0026 0000 - Variável Byte2MNEM
K001  K /0001  ; 0028 0001 - Constante = 0x001
K100  K /0100  ; 0030 0100 - Constante = 0x100
K02B  K /002B  ; 0032 002B - Constante = 0x02B
K002  K /0002  ; 0034 0002 - Constante = 0x002
K018  K /0018  ; 0036 0018 - Constante = 0x018
K050  K /0050  ; 0038 0050 - Constante = 0x050
K056  K /0056  ; 003A 0056 - Constante = 0x056
K030  K /0030  ; 003C 0030 - Constante = 0x030
K00A  K /000A  ; 003E 000A - Constante = 0x00A
K037  K /0037  ; 0040 0037 - Constante = 0x037
BRKL  K /0A0D  ; 0042 0A0D - Break line
; ================================================================================
; Implementação da sub-rotina OP2MNEM
; ================================================================================
@ /0100         ; Alocação da função em 0x100
OP2MNEM K /0000 ; 0100 0000 - Endereço de retorno da sub-rotina OP2MNEM
LD OP           ; 0102 8010 - Carrega o valor de OP no acumulador
- K001          ; 0104 5028 - Subtrai 0x001 do valor do acumulador
JN OP0          ; 0106 2146 - Desvio se o acumulador é negativo (OPCODE = 0x000)
- K001          ; 0108 5028 - Subtrai 0x001 do valor do acumulador
JN OP1          ; 010A 214C - Desvio se o acumulador é negativo (OPCODE = 0x001)
- K001          ; 010C 5028 - Subtrai 0x001 do valor do acumulador
JN OP2          ; 010E 2152 - Desvio se o acumulador é negativo (OPCODE = 0x002)
- K001          ; 0110 5028 - Subtrai 0x001 do valor do acumulador
JN OP3          ; 0112 2158 - Desvio se o acumulador é negativo (OPCODE = 0x003)
- K001          ; 0114 5028 - Subtrai 0x001 do valor do acumulador
JN OP4          ; 0116 215E - Desvio se o acumulador é negativo (OPCODE = 0x004)
- K001          ; 0118 5028 - Subtrai 0x001 do valor do acumulador
JN OP5          ; 011A 2164 - Desvio se o acumulador é negativo (OPCODE = 0x005)
- K001          ; 011C 5028 - Subtrai 0x001 do valor do acumulador
JN OP6          ; 011E 216A - Desvio se o acumulador é negativo (OPCODE = 0x006)
- K001          ; 0120 5028 - Subtrai 0x001 do valor do acumulador
JN OP7          ; 0122 2170 - Desvio se o acumulador é negativo (OPCODE = 0x007)
- K001          ; 0124 5028 - Subtrai 0x001 do valor do acumulador
JN OP8          ; 0126 2176 - Desvio se o acumulador é negativo (OPCODE = 0x008)
- K001          ; 0128 5028 - Subtrai 0x001 do valor do acumulador
JN OP9          ; 012A 217C - Desvio se o acumulador é negativo (OPCODE = 0x009)
- K001          ; 012C 5028 - Subtrai 0x001 do valor do acumulador
JN OPA          ; 012E 2182 - Desvio se o acumulador é negativo (OPCODE = 0x00A)
- K001          ; 0130 5028 - Subtrai 0x001 do valor do acumulador
JN OPB          ; 0132 2188 - Desvio se o acumulador é negativo (OPCODE = 0x00B)
- K001          ; 0134 5028 - Subtrai 0x001 do valor do acumulador
JN OPC          ; 0136 218E - Desvio se o acumulador é negativo (OPCODE = 0x00C)
- K001          ; 0138 5028 - Subtrai 0x001 do valor do acumulador
JN OPD          ; 013A 2194 - Desvio se o acumulador é negativo (OPCODE = 0x00D)
- K001          ; 013C 5028 - Subtrai 0x001 do valor do acumulador
JN OPE          ; 013E 219A - Desvio se o acumulador é negativo (OPCODE = 0x00E)
- K001          ; 0140 5028 - Subtrai 0x001 do valor do acumulador
JN OPF          ; 0142 21A0 - Desvio se o acumulador é negativo (OPCODE = 0x00F)
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP0 LD MJP      ; 0146 8400 - Carrega o valor em hexadecimal de MNEM = JP
MM MNEM         ; 0148 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP1 LD MJZ      ; 014C 8402 - Carrega o valor em hexadecimal de MNEM = JZ
MM MNEM         ; 014E 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP2 LD MJN      ; 0152 8404 - Carrega o valor em hexadecimal de MNEM = JN
MM MNEM         ; 0154 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP3 LD MLV      ; 0158 8406 - Carrega o valor em hexadecimal de MNEM = LV
MM MNEM         ; 015A 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP4 LD M+_      ; 015E 8408 - Carrega o valor em hexadecimal de MNEM = +_
MM MNEM         ; 0160 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP5 LD M-_      ; 0164 840A - Carrega o valor em hexadecimal de MNEM = -_
MM MNEM         ; 0166 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP6 LD M*_      ; 016A 840C - Carrega o valor em hexadecimal de MNEM = *_
MM MNEM         ; 016C 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP7 LD M/_      ; 0170 840E - Carrega o valor em hexadecimal de MNEM = /_
MM MNEM         ; 0172 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP8 LD MLD      ; 0176 8410 - Carrega o valor em hexadecimal de MNEM = LD
MM MNEM         ; 0178 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OP9 LD MMM      ; 017C 8412 - Carrega o valor em hexadecimal de MNEM = MM
MM MNEM         ; 017E 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OPA LD MSC      ; 0182 8414 - Carrega o valor em hexadecimal de MNEM = SC
MM MNEM         ; 0184 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OPB LD MRS      ; 0188 8416 - Carrega o valor em hexadecimal de MNEM = RS
MM MNEM         ; 018A 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OPC LD MHM      ; 018E 8418 - Carrega o valor em hexadecimal de MNEM = HM
MM MNEM         ; 0190 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OPD LD MGD      ; 0194 841A - Carrega o valor em hexadecimal de MNEM = GD
MM MNEM         ; 0196 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OPE LD MPD      ; 019A 841C - Carrega o valor em hexadecimal de MNEM = PD
MM MNEM         ; 019C 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
OPF LD MOS      ; 01A0 841E - Carrega o valor em hexadecimal de MNEM = OS
MM MNEM         ; 01A2 9012 - Guarda o valor carregado em MNEM
RS /0100        ; 01A4 B100 - Retorna para o endereço contido em 0x100
# OP2MNEM       ; Fim da função OP2MNEM
; ================================================================================
; Implementação da sub-rotina MNEM2OP
; ================================================================================
@ /0200         ; Início da função MNEM2OP
MNEM2OP K /0000 ; 0200 0000 - Endereço de retorno da sub-rotina MNEM2OP
SC SEPARABYTES ; 0202 A600 - Chamando a sub-rotina de separação dos bytes de MNEM
LD BYTE1       ; 0204 8024 - Carrega o valor de Byte1MNEM no acumulador
- K02B         ; 0206 5032 - Subtrai 0x02B do valor carregado no acumulador
JN M12A        ; 0208 223C - Desvio se acumulador é negativo (Byte1MNEM = 0x02A)
- K001         ; 020A 5028 - Subtrai 0x001 do valor carregado no acumulador 
JN M12B        ; 020C 2242 - Desvio se acumulador é negativo (Byte1MNEM = 0x02B)
- K002         ; 020E 5034 - Subtrai 0x002 do valor carregado no acumulador
JN M12D        ; 0210 2248 - Desvio se acumulador é negativo (Byte1MNEM = 0x02D)
- K002         ; 0212 5034 - Subtrai 0x002 do valor carregado no acumulador
JN M12F        ; 0214 224E - Desvio se acumulador é negativo (Byte1MNEM = 0x02F)
- K018         ; 0216 5036 - Subtrai 0x018 do valor carregado no acumulador
JN M147        ; 0218 2254 - Desvio se acumulador é negativo (Byte1MNEM = 0x047)
- K001         ; 021A 5028 - Subtrai 0x001 do valor carregado no acumulador
JN M148        ; 021C 225A - Desvio se acumulador é negativo (Byte1MNEM = 0x048)
- K002         ; 021E 5034 - Subtrai 0x002 do valor carregado no acumulador 
JN M14A        ; 0220 227E - Desvio se acumulador é negativo (Byte1MNEM = 0x04A)
- K002         ; 0222 5034 - Subtrai 0x002 do valor carregado no acumulador 
JN M14C        ; 0224 229A - Desvio se acumulador é negativo (Byte1MNEM = 0x04C)
- K001         ; 0226 5028 - Subtrai 0x001 do valor carregado no acumulador
JN M14D        ; 0228 2260 - Desvio se acumulador é negativo (Byte1MNEM = 0x04D)
- K002         ; 022A 5034 - Subtrai 0x002 do valor carregado no acumulador 
JN M14F        ; 022C 2266 - Desvio se acumulador é negativo (Byte1MNEM = 0x04F)
- K001         ; 022E 5028 - Subtrai 0x001 do valor carregado no acumulador
JN M150        ; 0230 226C - Desvio se acumulador é negativo (Byte1MNEM = 0x050)
- K002         ; 0232 5034 - Subtrai 0x002 do valor carregado no acumulador 
JN M152        ; 0234 2272 - Desvio se acumulador é negativo (Byte1MNEM = 0x052)
- K001         ; 0236 5028 - Subtrai 0x001 do valor carregado no acumulador
JN M153        ; 0238 2278 - Desvio se acumulador é negativo (Byte1MNEM = 0x053)
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M12A LV /0006  ; 023C 3006 - Carrega o valor 0x006 no acumulador (OPCODE = 0x006)
MM OP          ; 023E 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M12B LV /0004  ; 0242 3004 - Carrega o valor 0x004 no acumulador (OPCODE = 0x004)
MM OP          ; 0244 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M12D LV /0005  ; 0248 3005 - Carrega o valor 0x005 no acumulador (OPCODE = 0x005)
MM OP          ; 024A 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M12F LV /0007  ; 024E 3007 - Carrega o valor 0x007 no acumulador (OPCODE = 0x007)
MM OP          ; 0250 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M147 LV /000D  ; 0254 300D - Carrega o valor 0x00D no acumulador (OPCODE = 0x00D)
MM OP          ; 0256 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M148 LV /000C  ; 025A 300C - Carrega o valor 0x00C no acumulador (OPCODE = 0x00C)
MM OP          ; 025C 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M14D LV /0009  ; 0260 3009 - Carrega o valor 0x009 no acumulador (OPCODE = 0x009)
MM OP          ; 0262 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M14F LV /000F  ; 0266 300F - Carrega o valor 0x00F no acumulador (OPCODE = 0x00F)
MM OP          ; 0268 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M150 LV /000E  ; 026C 300E - Carrega o valor 0x00E no acumulador (OPCODE = 0x00E)
MM OP          ; 026E 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M152 LV /000B  ; 0272 300B - Carrega o valor 0x00B no acumulador (OPCODE = 0x00B)
MM OP          ; 0274 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M153 LV /000A  ; 0278 300A - Carrega o valor 0x00A no acumulador (OPCODE = 0x00A)
MM OP          ; 027A 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M14A LD BYTE2  ; 027E 8026 - Carrega o valor de Byte2MNEM no acumulador
- K050         ; 0280 5038 - Subtrai 0x050 do valor do acumulador
JN M24E        ; 0282 2288 - Desvio se negativo (MNEM = 4A4E)
JZ M250        ; 0284 128E - Desvio se zero (MNEM = 4A50)
JP M25A        ; 0286 0294 - Desvio incondicional (MNEM = 4A5A)
M24E LD K002   ; 0288 3002 - Carrega o valor 0x002 no acumulador (OPCODE = 0x002)
MM OP          ; 028A 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M250 LV /0000  ; 028E 3000 - Carrega o valor 0x000 no acumulador (OPCODE = 0x000)
MM OP          ; 0290 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M25A LV /0001  ; 0294 3001 - Carrega o valor 0x001 no acumulador (OPCODE = 0x001)
MM OP          ; 0296 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M14C LD BYTE2  ; 029A 8026 - Carrega o valor de Byte2MNEM no acumulador
- K056         ; 029C 503A - Subtrai 0x056 do valor do acumulador
JN M244        ; 029E 22A2 - Desvio se negativo (MNEM = 4C44)
JZ M256        ; 02A0 12A8 - Desvio se zero (MNEM = 4C56)
M244 LV /0008  ; 02A2 3008 - Carrega o valor 0x008 no acumulador (OPCODE = 0x008)
MM OP          ; 02A4 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
M256 LV /0003  ; 02A8 3003 - Carrega o valor 0x003 (OPCODE = 0x003) no acumulador
MM OP          ; 02AA 9010 - Armazena o valor carregado na variável global OPCODE
RS /0200       ; 023A B200 - Retorna para o endereço contido em 0x0200
# MNEM2OP      ; Fim da função MNEM2OP
; ================================================================================
; Programa principal
; ================================================================================
@ /0300               ; 0300 0302 - Início do programa
MAIN SC TESTESOP2MNEM ; 0302 A800 - Chama a sub-rotina de testes de OP2MNEM
SC TESTESMNEM2OP      ; 0304 A900 - Chama a sub-rotina de testes de MNEM2OP
HM /0000              ; Parada
# MAIN                ; 0306 C306 - Fim do programa
; ================================================================================
; Tabela de mnemônicos
; ================================================================================
MJP K /4A50 ; 0400 4A50 - Valor em hexadecimal de MNEM = JP
MJZ K /4A5A ; 0402 4A5A - Valor em hexadecimal de MNEM = JZ
MJN K /4A4E ; 0404 4A4E - Valor em hexadecimal de MNEM = JN
MLV K /4C56 ; 0406 4C56 - Valor em hexadecimal de MNEM = LV
M+_ K /2B5F ; 0408 2B5F - Valor em hexadecimal de MNEM = +_
M-_ K /2D5F ; 040A 2D5F - Valor em hexadecimal de MNEM = -_
M*_ K /2A5F ; 040C 2A5F - Valor em hexadecimal de MNEM = *_
M/_ K /2F5F ; 040E 2F5F - Valor em hexadecimal de MNEM = /_
MLD K /4C44 ; 0410 4C44 - Valor em hexadecimal de MNEM = LD
MMM K /4D4D ; 0412 4D4D - Valor em hexadecimal de MNEM = MM
MSC K /5343 ; 0414 5343 - Valor em hexadecimal de MNEM = SC
MRS K /5253 ; 0416 5253 - Valor em hexadecimal de MNEM = RS
MHM K /484D ; 0418 484D - Valor em hexadecimal de MNEM = HM
MGD K /4744 ; 041A 4744 - Valor em hexadecimal de MNEM = GD
MPD K /5044 ; 041C 5044 - Valor em hexadecimal de MNEM = PD
MOS K /4F53 ; 041E 4F53 - Valor em hexadecimal de MNEM = OS
; ===============================================================================
; Implementação da sub-rotina de separação de bytes de MNEM
; ================================================================================
@ /0600             ; Início da função SEPARABYTES
SEPARABYTES K /0000 ; 0600 0000 - Endereço de retorno
LD MNEM             ; 0602 8012 - Carrega o valor de MNEM
* K100              ; 0604 6030 - Multiplica o valor por 0x100
/ K100              ; 0606 7030 - Divide o valor por 0x100
MM BYTE2            ; 0608 9026 - Armazena o byte na variável Byte2MNEM
LD MNEM             ; 060A 8012 - Carrega o valor de MNEM no acumulador
/ K100              ; 060C 7030 - Divide por 0x100
MM BYTE1            ; 060E 9024 - Armazena o byte na variável Byte1MNEM
RS /0600            ; 0610 B600 - Retorna para o endereço contido em 0x600
# SEPARABYTES       ; Fim da função SEPARABYTES
; ================================================================================
; Implementação da sub-rotina de impressão dos valores de OP e MNEM na tela
; Resultado apresentado: OP: <OPCODE> MNEM: <MNEM> 
; ================================================================================
@ /0700           ; Início da função IMPRIME
IMPRIME K /0000   ; 0700 0000 - Endereço de retorno
LD BRKL           ; 0702 8042 - Carrega a quebra de linha para o acumulador
PD /0100          ; 0704 E100 - Imprime a quebra de linha
LV /004F          ; 0706 304F - Carrega "O" para o acumulador
PD /0100          ; 0708 E100 - Imprime "O"
LV /0050          ; 070A 3050 - Carrega "P" para o acumulador
PD /0100          ; 070C E100 - Imprime "P"
LV /003A          ; 070E 303A - Carrega ":" para o acumulador
PD /0100          ; 0710 E100 - Imprime ":"
LV /0020          ; 0712 3020 - Carrega " " para o acumulador
PD /0100          ; 0714 E100 - Imprime " "
LD OP             ; 0716 8010 - Carrega o valor de OPCODE para o acumulador
- K00A            ; 0718 503E - Subtrai 0x00A do valor do acumulador
JN IMPRIMENUMS    ; 071A 2744 - Desvio se acumulador é negativo
LD OP             ; 071C 8010 - Carrega o valor de OPCODE para o acumulador
+ K037            ; 071E 4040 - Soma 0x037 ao valor de OPCODE
PD /100           ; 0720 E100 - Imprime o valor de OPCODE
LV /0020          ; 0722 3020 - Carrega " " para o acumulador
PD /100           ; 0724 E100 - Imprime " "
LV /004D          ; 0726 304D - Carrega "M" para o acumulador
PD /100           ; 0728 E100 - Imprime "M"
LV /004E          ; 072A 304E - Carrega "N" para o acumulador
PD /100           ; 072C E100 - Imprime "N"
LV /0045          ; 072E 3045 - Carrega "E" para o acumulador
PD /100           ; 0730 E100 - Imprime "E"
LV /004D          ; 0732 304D - Carrega "M" para o acumulador
PD /100           ; 0734 E100 - Imprime "M"
LV /003A          ; 0736 303A - Carrega ":" para o acumulador
PD /100           ; 0738 E100 - Imprime ":"
LV /0020          ; 073A 3020 - Carrega " " para o acumulador
PD /100           ; 073C E100 - Imprime " "
LD MNEM           ; 073E 8012 - Carrega o valor de MNEM para o acumulador
PD /100           ; 0740 E100 - Imprime o valor de MNEM
RS /0700          ; 0742 B700 - Retorna para o endereço em 0x700
# IMPRIME         ; Fim da função IMPRIME
IMPRIMENUMS LD OP ; 0744 8010 - Carrega o valor de OPCODE para o acumulador
+ K030            ; 0746 403C - Soma 0x030 ao valor de OPCODE
PD /100           ; 0748 E100 - Imprime o valor de OPCODE
LV /0020          ; 074A 3020 - Carrega " " para o acumulador
PD /100           ; 074C E100 - Imprime " "
LV /004D          ; 074E 304D - Carrega "M" para o acumulador
PD /100           ; 0750 E100 - Imprime "M"
LV /004E          ; 0752 304E - Carrega "N" para o acumulador
PD /100           ; 0754 E100 - Imprime "N"
LV /0045          ; 0756 3045 - Carrega "E" para o acumulador
PD /100           ; 0758 E100 - Imprime "E"
LV /004D          ; 075A 304D - Carrega "M" para o acumulador
PD /100           ; 075C E100 - Imprime "M"
LV /003A          ; 075E 303A - Carrega ":" para o acumulador
PD /100           ; 0760 E100 - Imprime ":"
LV /0020          ; 0762 3020 - Carrega " " para o acumulador
PD /100           ; 0764 E100 - Imprime " "
LD MNEM           ; 0766 8012 - Carrega o valor de MNEM para o acumulador
PD /100           ; 0768 E100 - Imprime o valor de MNEM
RS /0700          ; 0742 B700 - Retorna para o endereço em 0x700
# IMPRIME         ; Fim da função IMPRIME
; ================================================================================
; Testes para a função OP2MNEM
; ================================================================================
@ /0800                ; Início da função TESTESOP2MNEM
TESTESOP2MNEM K /0000  ; 0800 0000 - Endereço de retorno
LV /0000               ; 0802 3000 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0804 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0806 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0808 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /0001               ; 080A 3001 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 080C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 080E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0810 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /0002               ; 0812 3002 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0814 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0816 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0818 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /003                ; 081A 3003 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 081C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 081E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0820 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /0004               ; 0822 3004 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0824 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0826 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0828 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /005                ; 082A 3005 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 082C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 082E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0830 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /0006               ; 0832 3006 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0834 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0836 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0838 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /0007               ; 083A 3007 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 083C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 083E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0840 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /0008               ; 0842 3008 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0844 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0846 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0848 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /0009               ; 084A 3009 - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 084C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 084E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0850 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /000A               ; 0852 300A - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0854 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0856 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0858 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /000B               ; 085A 300B - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 085C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 085E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0860 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /000C               ; 0862 300C - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0864 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0866 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0868 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /000D               ; 086A 300D - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 086C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 086E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0870 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /000E               ; 0872 300E - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 0874 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 0876 A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0878 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LV /000F               ; 087A 300F - Carrega para o acumulador o valor desejado para OP
MM OP                  ; 087C 9010 - Guarda o valor na variável global OPCODE
SC OP2MNEM             ; 087E A100 - Chama a sub-rotina OP2MNEM
SC IMPRIME             ; 0880 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
RS /0800               ; 0882 B800 - Retorna para o endereço contido em 0x800
# TESTESOP2MNEM        ; Fim da função TESTESOP2MNEM
; ================================================================================
; Testes para a função MNEM2OP
; ================================================================================
@ /0900              ; Início da função TESTESMNEM2OP
TESTESMNEM2OP K /0000 ; 0900 0000 - Endereço de retorno
LD MJP               ; 0902 8400 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0904 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0906 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0908 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MJZ               ; 090A 8402 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 090C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 090E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0910 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MJN               ; 0912 8404 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0914 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0916 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0918 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MLV               ; 091A 8406 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 091C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 091E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0920 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD M+_               ; 0922 8408 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0924 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0926 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0928 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD M-_               ; 092A 840A - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 092C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 092E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0930 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD M*_               ; 0932 840C - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0934 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0936 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0938 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD M/_               ; 093A 840E - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 093C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 093E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0940 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MLD               ; 0942 8410 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0944 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0946 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0948 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MMM               ; 094A 8412 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 094C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 094E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0950 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MSC               ; 0952 8414 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0954 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0956 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0958 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MRS               ; 095A 8416 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 095C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 095E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0960 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MHM               ; 0962 8418 - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0964 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0966 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0968 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MGD               ; 096A 841A - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 096C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 096E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0970 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MPD               ; 0972 841C - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 0974 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 0976 A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0978 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
LD MOS               ; 097A 841E - Carrega para o acumulador o valor desejado para MNEM
MM MNEM              ; 097C 9012 - Guarda o valor na variável global MNEM
SC MNEM2OP           ; 097E A200 - Chama a sub-rotina MNEM2OP
SC IMPRIME           ; 0980 A700 - Chama a sub-rotina que imprime os valores de OP e MNEM atuais
RS /0900             ; 0982 B900 - Retorna para o endereço contido em 0x900
# TESTESMNEM2OP      ; Fim da função TESTESMNEM2OP
; ================================================================================
