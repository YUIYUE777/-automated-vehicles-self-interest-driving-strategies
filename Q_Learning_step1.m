function [state,action,r,flag_break,speed_new] = Q_Learning_step1(Q,LINK,TLINK,IndexOfCell,numOfCell,maxSpeed,p,epsilon,nominalSpeed,lane_id)
% Actionspace index
% 1:a=3
% 2:a=1
% 3:a=0
% 4:a=-1
% 5:a=-3
% 6:������a=0
a_0=[3,1,0,-1,-3,0]; %���ٶ�
flag_break=false;

% get state and actionspace
[state,ActionSpace] = GetStateAction(LINK,TLINK,IndexOfCell,numOfCell,maxSpeed,p,lane_id);

% choose action��acc�� according to epsilon-greedy policy
if rand() <= epsilon  %epsilon=0.1
    action = ActionSpace(uint16(rand*(length(ActionSpace)-1)+1)); 
else
    [~, action] = max(Q(state,ActionSpace));
end

%�ٶȸ���
if action == 6
    flag_break = true; %������Ϊ6������������Ҫ������������������ѭ��
    speed_new = LINK(IndexOfCell);
    
else
    a=a_0(action); %�õ����ٶ�
    speed_new = LINK(IndexOfCell)+a;
    speed_new = max(0,speed_new);
    emptyFront = GetEmptyFront(LINK, numOfCell, maxSpeed, IndexOfCell);
    speed_new = min(speed_new,emptyFront);
    %�������
    r=unifrnd(0,1);
    if r<=0.05 %�����������
       speed_new=speed_new-1; 
    end
    speed_new= max(0,speed_new);%��֤������
end

%���影������
%������ٶȳͷ�
if action ==2 || action==5  %ǿ�ӻ�ǿ���٣��ͷ�-5
    acc=-5;
elseif action==3 || action==6 %���֣����ͷ�
    acc=0;
else %���࣬�ͷ�-1
    acc=-1;
end
% r = GetReward(nominalSpeed,speed_new);    
r = GetReward(nominalSpeed,speed_new,acc);

end

