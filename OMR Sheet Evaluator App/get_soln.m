function soln=get_soln(ansfl,n_question)
        real_ans=zeros(1,n_question); % initializes real ans
        n=n_question;
        for j=1:5 % indexing 5 columns
            y_ans=linspace(875,1695,11);  % center positions in y-axis
            x_ans=linspace(237+283*(j-1),360+283*(j-1),4); % center positions in x-axis for all columns
            for i=1:10 % indexing 10 rows in each column
                if i<=5  %uper 5 rows
                    for k=1:4   % indexing options of a row
                        s = sum(sum(ansfl(y_ans(i)-15:y_ans(i)+15,x_ans(k)-15:x_ans(k)+15)));
                                % doing summation of the intesities of the circles
                        if s>400     % counting as filled up when more than 55% is filled
                            real_ans((j-1)*10+i)=k; % storing ans
                            break;
                        end
                    end
                else      %same thing for lower 5 rows
                    for k=1:4 
                         s = sum(sum(ansfl(y_ans(i+1)-15:y_ans(i+1)+15 ...
                                ,x_ans(k)-15:x_ans(k)+15)));
                        if s>400
                            real_ans((j-1)*10+i)=k;
                             break;
                        end
                     end
                end
                if n==((j-1)*10+i)
                    break;    % breaks row indexing if it finished checking desired number of questions.
                end
            end
            if n==((j-1)*10+i)
                break;  % breaks column indexing if it finished checking desired number of questions.
            end
        end
        soln=real_ans;
end