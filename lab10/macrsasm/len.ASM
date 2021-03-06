.386
.model FLAT,C


PUSHR MACRO RG
	IRP REG, <RG>
	   IFIDN <REG>, <F>
	     PUSHF
	   ELSE
		 PUSH REG
	   ENDIF
	ENDM
ENDM   

POPR MACRO RG
   IRP REG, <RG>
	   IFIDN <REG>, <F>
	     POPF
	   ELSE
		 POP REG
	   ENDIF
	ENDM
ENDM 

PROLOG MACRO

	PUSH EBP
	MOV EBP,ESP

	MOV EDI, DWORD PTR[EBP+8]

	PUSHR <EDI, F>

ENDM

EPILOG MACRO

	POPR <F, EDI>

ENDM

PUBLIC LEN

.CODE
LEN PROC
  PROLOG

  MOV ECX, -1
  NOT ECX 

  XOR AL, AL
  CLD
  MOV EAX, 0

  REPNE SCASB 
  NEG ECX

  LEA EAX, [ECX - 1]


KON:
  EPILOG
  RET

LEN ENDP
END