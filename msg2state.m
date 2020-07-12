function state = msg2state(message)

% consider environment cars (6 params)
num_str = '';
fields = fieldnames(message); %����message��Ա�������б�,str����

for i = 1:length(fields)-1     %������lane_id
   str_temp = num2str(message.(fields{i}) - 1); %����0��1��2
   num_str = strcat(num_str,str_temp);
end
id_temp = base2dec(num_str,3); %starting from 0 to NUM_STATES/2    = 728  %�����ƻ�Ϊʮ����,״̬���

% consider lane info
if message.lane_id == 1
    state = id_temp;
else
    state = 729 + id_temp;
end

state = state + 1;  %starting from 1 to NUM_STATES = 1458

% ����1��1����>729
% ����2��730����>1458
