function [Kp, Ki_Kp, Kd_Kp, dmd, enable] = adaptiveCnt(Qd,Qi)
    % GENERAL CONTROLLER PARAMETERS
    Kp = 2;
    Kd_Kp = 0.2;
    Ki_Kp = 1.5;
    dmd = 0;    
    enable = 1; % -enables overall filter for final controller output before feeding the system
    
    if(Qi==0)               % // All cases where Start Angle (Qi) is 0.
        if Qd >= Qi             % // For Positive Desired Angle (Qd)
            if(Qd >= 70)
                Ki_Kp = 0.000175516192225661*Qd^2 - 0.0462900721904603*Qd + 2.74258543457608;             
            elseif (Qd >= 45)
                Ki_Kp = 0.000175516192225661*Qd^2 - 0.0462900721904603*Qd + 2.627632959313750;
            elseif (Qd >= 30)
                Ki_Kp = 0.000175516192225661*Qd^2 - 0.0462900721904603*Qd + 2.74258543457608;
                dmd = 8.921011874031939e-07*Qd^5 - 3.685173886516096e-05*Qd^4 - 0.001518186511475*Qd^3 + 0.068177750660973*Qd^2 - 1.184019962140772*Qd + 40.090697892711330;
            elseif (Qd < 30)            
                dmd = 8.921011874031939e-07*Qd^5 - 3.685173886516096e-05*Qd^4 - 0.001518186511475*Qd^3 + 0.068177750660973*Qd^2 - 1.184019962140772*Qd + 40.090697892711330;
            end
        else                    % // For Negative Desired Angle (Qd)
            if(Qd>=-20) 
               dmd = -2*Qd + 40; 
            else
                dmd = 80;
            end
        end
    elseif Qi>0 && Qd==0    % // All cases where Qi is positive and Qd is 0.
        
        if Qi<50
            dmd = 7.195027195027213e-04*Qi^3 - 0.027668997668998*Qi^2 + 1.274203574203577*Qi + 40.418318158520410;
        elseif Qi<70
            dmd = 124.89;
        else
            dmd = 0.032252207125414*Qi^2 - 2.325646484252623*Qi + 1.307144824995270e+02; 
            Ki_Kp = -1.264792436290815e-04*Qi^2 - 6.837392774397380e-04*Qi + 2.165825558825345; 
        end
        
    elseif Qi == -90        % // All cases where Qi is -90.
        if Qd <= -70
            enable = 0;
            Ki_Kp = 3;
            Kp = 0.6;
        elseif Qd <= -40
            enable = 0;
            Ki_Kp = 5.925925925926097e-05*Qd^3 + 0.008190476190476*Qd^2 + 0.328518518518530*Qd + 6.022222222222408;
            Kp = 5.555555555555661e-05*Qd^3 + 0.007642857142857*Qd^2 + 0.380396825396832*Qd + 8.533333333333440;
        elseif Qd <= 30
            Ki_Kp = -6.313131313131334e-06*Qd^3 + 8.387445887445803e-05*Qd^2 - 0.012848124098124*Qd + 1.126623376623377;
            Kp = 2;
        else
            Ki_Kp = 2.727236199854714e-07*Qd^4 - 6.619203811799032e-05*Qd^3 + 0.005640287022121*Qd^2 - 0.207466259546331*Qd + 3.363611519226011;
            Kp = -5.798900495588756e-07*Qd^4 + 1.491761329295650e-04*Qd^3 - 0.013744414002193*Qd^2 + 0.510560174649890*Qd - 4.502360006537398;
        end
            
    elseif (Qd<Qi)          % // All the rest cases where Qd<Qi.
        dQ = Qi-Qd;
        if Qd>80 && dQ<6
            dmd =0;
        elseif Qd>80 && dQ>6
            dmd = dQ-6;
        elseif Qd>70 && dQ<=10
            dmd = dQ + 15;  
        elseif Qd>70 && dQ>10  
            dmd = 1.5*dQ + 10; 
        elseif Qd>60 && dQ<=10 
            dmd = dQ+20;
        elseif Qd>60 && dQ>10 
            dmd = dQ + 20;
        elseif Qd>50 && dQ<=10 
            dmd = 1.1*dQ+25;
        elseif Qd>50 && dQ>10 
            dmd = 0.8*dQ + 28;
        elseif Qd>40 && dQ<=10 
            dmd = 1.5*dQ + 25;
        elseif Qd>40 && dQ>10 
            dmd = 1.375*dQ + 21.25;
        elseif Qd>30 && dQ<=10 
            dmd = 0.9*dQ + 35;
        elseif Qd>30 && dQ>10 
            dmd = 1.12*dQ + 22.8;
        elseif Qd>20 && dQ<=10 
            dmd = 1.2*dQ + 35;
        elseif Qd>10 && dQ>10 
            dmd = dQ + 40;
        elseif Qd>10 && dQ>10 
            dmd = 1.71*dQ + 32.86;
        elseif Qd>0 && dQ>10 
            dmd = dQ + 40;
        elseif Qd>0 && dQ>10 
            dmd = 1.625*dQ + 33.75;
        end
                
    elseif Qi>45 && Qd>Qi 
        Kp = 1;
        Ki_Kp = 0.3;
    elseif Qi>20 && Qd>Qi
        Kp = 1.4;
        Ki_Kp = 0.6;
    elseif Qd>=70
        Kp = 1;
        Ki_Kp = 0.1;
    end
                           
end
