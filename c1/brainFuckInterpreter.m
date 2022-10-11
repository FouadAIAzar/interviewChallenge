clear
string = "+++>+++[ <[<] +<-]";
string = strtrim(string);
string = convertStringsToChars(string);
len = length(string);
ptr_position = 1;

memory = zeros(1000,1);

outLen = length(find(string=='.'));
print = zeros(outLen,1);
k = 1;
j = 1;
i = 1;

while(i~=len+1)
    val = string(i);
    switch val
        case '+'
            memory(ptr_position) = memory(ptr_position) + 1;
        case '-'
            memory(ptr_position) = memory(ptr_position) - 1;
        case '>'
            ptr_position = ptr_position + 1;
        case '<'
            ptr_position = ptr_position - 1;
        case '['
            condition = memory(ptr_position);
            loopStart = i;
        case ']'
            if(condition~=1)
                i = loopStart-1;
            end
        case '.'
            print(k) = memory(ptr_position);
            k=k+1;

         case ','
            prompt = "insert a single char (in '') or int, please.";
            Byte = input(prompt);
            Byte = double(Byte(1));
            memory(ptr_position) = Byte;
    end
    j = j+1;
    results(j,:) = memory;
    i = i+1;
    
end
Out=char(print);
Out'

