function [LINK,Vehicle,index,flag] = LoadVehicle(curTime, LINK, maxSpeed,linkname,Vehicle,index,flag)
    if mod(curTime,2)==0 && isnan(LINK(1,1)) && (flag<150) %���curTime��ż����Link�����һ��һ�е���ΪNAN,�����ɳ���ÿ����������300��
        LINK(1,1)=maxSpeed; %��ô��Link�����һ��һ�е�/����ֵΪ����ٶ�
        index=index+1;
        flag=flag+1;
        %r=unifrnd(0,1);
%         if mod(flag,5)==0 %����AV  20%  
        if mod(flag,14)==0 %����10��AV*2  
            [id,position,curSpeed,changeLine,Vtype,LINKname,curflag,state,action,reward,curTime]=SetVehicle(index,1,linkname,1,1,LINK,0,0,0,0,curTime);
            Vehicle(index,:)=[id,position,curSpeed,changeLine,Vtype,LINKname,curflag,state,action,reward,curTime];
        else %    ����HV
            [id,position,curSpeed,changeLine,Vtype,LINKname,curflag,state,action,reward,curTime]=SetVehicle(index,1,linkname,2,1,LINK,0,nan,nan,nan,curTime);
            Vehicle(index,:)=[id,position,curSpeed,changeLine,Vtype,LINKname,curflag,state,action,reward,curTime];
            
        end
    end  %������������������������ԭLink��ֵ
        
%     if isnan(LINK(1,1))
%         r=unifrnd(0,1);
%         if r<=0.5
%             LINK(1,1)=maxSpeed;            
%         end
%     end index,IndexOfCell,LinkName,type,flag,LINK,change,state,action,reward,curtime
    
end

