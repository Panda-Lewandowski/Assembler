;��������� ������������ � ������ Count ����
;      function (const S: LONGWORD; L:LONGWORD)
;������������ ����� ������ ������� ������ S ����� L.

.386
.model FLAT,PASCAL
PUBLIC COUNT

.CODE
COUNT:
A EQU DWORD PTR[EBP+12]       ;���� ������
L EQU DWORD PTR[EBP+8]        ;����� ������
  PUSH EBP                    ;����� ������ ����� EBP
  MOV EBP,ESP                 ;����� � EBP ������� �������� ESP

  PUSH EBX                    ;��������� ��������
  PUSH EAX
  PUSH ECX
  PUSH EDX

  MOV EAX,0                   ;���������
  MOV EBX,A                   ;����� ����� ������
  MOV ECX,L                   ;����� ������

M0:
  MOV EDX,1
M:
  TEST [EBX],EDX              ;��������� EDX � ������
  JZ M2                       ;���� 0
  INC EAX                     ;EAX += 1
M2:
  DEC ECX                     ;��������� �������� �����
  JZ M4                       ;�� ��� ��� ���� ����� != 0, �������� �������
  SHL EDX,1                   ;��������� ����� �����, �������� � CX ���
  JC M3                       ;���� CF = 1, ���� �� �3
  JMP M                       ;����� ���� �� �
M3:
  ADD EBX,4                   ;�� ���� ��� ��� ������� ����� ��� ������
  JMP M0
M4:
  POP EDX                     ;�������������� ���������
  POP ECX
  POP EAX
  POP EBX
  POP EBP                     ;� ��������� EBP
  RET 8
END