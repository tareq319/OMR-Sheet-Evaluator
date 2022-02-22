function obtained_mark=evaluate_single_omr(answer_image,soln,n_question)
     ifl=answer_image;
     n=n_question;
            real_ans=soln;
            marks=0;
            for j=1:5
                y_ans=linspace(875,1695,11);
                x_ans=linspace(237+283*(j-1),360+283*(j-1),4);
                for i=1:10
                    fill=0;
                    flag=0;
                    if i<=5
                        for k=1:4
                            s = sum(sum(ifl(y_ans(i)-15:y_ans(i)+15, ...
                                x_ans(k)-15:x_ans(k)+15)));
                            if s>400
                                fill=fill+1; %counts the number of filled circles
                                if real_ans((j-1)*10+i)==k
                                    flag=1; % checking with real answer
                                end
                            end
                        end
                    else
                        for k=1:4
                            s = sum(sum(ifl(y_ans(i+1)-15:y_ans(i+1)+15 ...
                                ,x_ans(k)-15:x_ans(k)+15)));
                            if s>500 
                                fill=fill+1; 
                                if real_ans((j-1)*10+i)==k
                                    flag=1;
                                end
                            end
                        end
                    end
                    if fill==1 && flag == 1 % checking whether right circle and single circle is filled
                        marks=marks+1;
                    end
                    if n==((j-1)*10+i)
                        break;
                    end
                end
                if n==((j-1)*10+i)
                    break;
                end
            end
    obtained_mark=marks;
end