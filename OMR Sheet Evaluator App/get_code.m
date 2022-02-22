function [code,validity]=get_code(answer_image)
    ifl=answer_image;
    y_code = linspace(348,717,10);
    x_code = linspace(640,720,3);
    code=0;
    validity=1;
    for j=1:3
        fill=0;
        fill_index=0;
        for i=1:10
            s = sum(sum(ifl(y_code(i)-15:y_code(i)+15, ...
                        x_code(j)-15:x_code(j)+15)));
            if s>400
                fill=fill+1; % counts number of filled circles in a column
                fill_index=i; % reconds filled index
            end
        end
        if fill==1
                code=code*10+mod(fill_index,10);
        else
            validity=0;
        end
    end
end