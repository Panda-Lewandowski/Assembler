.386
.model FLAT,PASCAL
PUBLIC START
extern COUNT:near, A_B:near, SetCler:near;, A_U_B:near

.DATA
S 	DD 0,0,0,0
S1 	DD 00001111000011110000111100001111B,1010101B
           ;0-38 - ������� ������
S2 	DD 00111100001111000011110000111100B,1000001B
           ;0-38 - ������� ������
L DD 39;= ����� ������


.CODE
START:
   PUSH OFFSET S1           ;����������� ����� s1
   PUSH L                   ;����������� ����� ������
   CALL COUNT

   PUSH OFFSET S1           ;����������� ����� S
   PUSH 1                   ;������ S
   PUSH 1                   ;�������� P - ����� �� �������� 34� ������
   CALL SetCler             ;S2,34

   PUSH OFFSET S2
   PUSH 34
   PUSH 0                    ;����� �� ������ 34� ������ ��������
   CALL SetCler              ;S2,34

   PUSH OFFSET S1           ;����� ������ ������
   PUSH OFFSET S2           ;����� ������ ������
   PUSH L                   ;����� ������
   CALL A_B                 ; S1,S2,38


RET;
END
