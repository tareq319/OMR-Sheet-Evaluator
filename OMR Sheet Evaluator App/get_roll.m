function [roll,validity]=get_roll(answer_image)
    ifl=answer_image;
    y_roll = linspace(347,716,10); 
    x_roll = linspace(155,524,10);
        roll=0;
        validity=1; 
        for j=1:10 % indexing columns
            fill=0; 
            fill_index=0; 
            for i=1:10
                s = sum(sum(ifl(y_roll(i)-15:y_roll(i)+15,x_roll(j)-15:x_roll(j)+15)));
                if s>400
                    fill=fill+1; % counts number of filled circles in a column
                    fill_index=i; % reconds filled index
                end
            end
            if fill==1
                roll=roll*10+mod(fill_index,10); %records digits of roll
            else
                validity=0;
            end
        end
end