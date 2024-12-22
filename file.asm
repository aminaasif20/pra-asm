INCLUDE Irvine32.inc

.data
str1 SWORD -3,-4,-5,6,7,8,-4
sum SDWORD 0
count SDWORD 0

.code
main proc
    mov esi,OFFSET str1
    mov ecx,LENGTHOF str1
    mov eax,0 ; sum ko initialize karo
    mov ebx,0

start_:
    test word ptr[esi],8000h ; negative number check karo
    jz skip ; agar number positive hai, to skip karo
    movsx edx,WORD PTR[esi] ; negative number ko edx mein load karo
    add eax,edx ; sum mein add karo
    inc ebx
skip:
    add esi,TYPE str1 ; esi ko agle element ki aur badhao
    loop start_ ; loop continue karo

    mov sum,eax ; sum ko memory mein store karo
    mov count,ebx
    mov eax,sum ; sum ko eax mein load karo
    call WriteInt ; sum ko print karo
    call crlf ; newline print karo
    mov eax,count
    call WriteInt


    exit
main endp
end main