clear;
clc;

%%
%load('New_ALLDATA_10_5.1.mat');
load('EN_ALLDATA_6_6.mat');
%load('test_AV_2veh.mat');
%load('60to80,EN_ALLDATA_8_6.1.mat');
%%
i_1=0;
i_2=0;
sum_1=0;
sum_2=0;
speed_1=0;
speed_2=0;
speed_1_av=0;
speed_2_av=0;
d_1=0;
d_2=0;
q_1=0;
q_2=0;
for t=5000:1:maxTime %change
    row_1=ALL_LINK_1(t,:);
    row_1_av=ALL_AV_LINK_1(t,:);
    row_2=ALL_LINK_2(t,:);
    row_2_av=ALL_AV_LINK_2(t,:);
    i_1=0;
    i_2=0;
    sum_1=0;
    sum_2=0;
    i_1_av=0;
    i_2_av=0;
    sum_1_av=0;
    sum_2_av=0;
    for cell_i=1:1:numOfCell
        if ~isnan(row_1(cell_i))
            i_1=i_1+1; %����
            sum_1=sum_1+row_1(cell_i); %�ٶȼӺ�
        end
        if ~isnan(row_2(cell_i))
            i_2=i_2+1; %����
            sum_2=sum_2+row_2(cell_i); %�ٶȼӺ�
        end
        if ~isnan(row_1_av(cell_i))
            i_1_av=i_1_av+1; %����
            sum_1_av=sum_1_av+row_1_av(cell_i); %�ٶȼӺ�
        end
        if ~isnan(row_2_av(cell_i))
            i_2_av=i_2_av+1; %����
            sum_2_av=sum_2_av+row_2_av(cell_i); %�ٶȼӺ�
        end
    end
    d_1=d_1+i_1;
    d_2=d_2+i_2;
    
    if i_1~=0
        q_1=q_1+(i_1/10)*(sum_1/i_1*cellL*3.6);%����=�ܶ�(veh/km)*ƽ���ٶ�(km/h)
        speed_1=speed_1+sum_1/i_1;
    end
    if i_2~=0 
        q_2=q_2+(i_2/10)*(sum_2/i_2*cellL*3.6);
        speed_2=speed_2+sum_2/i_2;
    end
    if i_1_av~=0
        speed_1_av=speed_1_av+sum_1_av/i_1_av;
    end
    if i_2_av~=0
        speed_2_av=speed_2_av+sum_2_av/i_2_av;
    end
end

i_3=0;
i_4=0;
i_5=0;
i_6=0;
i_7=0;
i_8=0;
% i_9=0;
% i_10=0;
for i=1:1:index_1
    if Vehicle_1(i,1)~=0 %����ڳ����ϵĳ�����
        i_3=i_3+1;
        if Vehicle_1(i,5)==1 %��AV
            i_7=i_7+1;
        end
    elseif Vehicle_1(i,1)==0 && Vehicle_1(i,5)==2 %���
        i_5=i_5+1;%������������
    end
end
for i=1:1:index_2
    if Vehicle_2(i,1)~=0 
        i_4=i_4+1;
        if Vehicle_2(i,5)==1 %��AV
            i_8=i_8+1;
        end
    else
        i_6=i_6+1;%������������
    end
end

density_1 = roundn(d_1/(10*5*1e3),-2);%change
density_2 = roundn(d_2/(10*5*1e3),-2);%change
Speed_1 = roundn(speed_1/5000*cellL*3.6,-2);%change
Speed_2 = roundn(speed_2/5000*cellL*3.6,-2);%change
Speed_1_av = roundn(speed_1_av/5000*cellL*3.6,-2);%change
Speed_2_av = roundn(speed_2_av/5000*cellL*3.6,-2);%change
volume_1 = round(q_1/5000);%change
volume_2 = round(q_2/5000);%change
AvgSpeed = roundn((Speed_1+Speed_2)/2,-2);
AvgSpeed_av = roundn((Speed_1_av+Speed_2_av)/2,-2);
AvgVolume = round((volume_1+volume_2)/2);
AvgDensity = roundn((density_1+density_2)/2,-2);

% fprintf('Average N of lane 1= %d\n',round(i_1/1000));%���㳵��1�ĳ�����
% fprintf('Average N of lane 2 = %d\n',round(i_2/1000));%���㳵��2�ĳ�����
fprintf('density of lane 1 = %d veh/km \n',density_1);%���㳵��1���ܶ�
fprintf('density of lane 2 = %d veh/km \n',density_2);%���㳵��2���ܶ�
fprintf('volume of lane 1 = %d veh/h \n',volume_1);%���㳵��1������
fprintf('volume of lane 2 = %d veh/h \n',volume_2);%���㳵��2������
fprintf('Average speed of lane 1 = %d km/h, Average speed of AV = %d km/h \n',Speed_1,Speed_1_av);%���㳵��1��ƽ���ٶ�
fprintf('Average speed of lane 2 = %d km/h, Average speed of AV = %d km/h \n',Speed_2,Speed_2_av);%���㳵��1��ƽ���ٶ�
fprintf('Vehicle on lane 1 = %d��AV = %d, lane change vehicle = %d \n',i_3,i_7,i_5);
fprintf('Vehicle on lane 2 = %d��AV = %d, lane change vehicle = %d \n',i_4,i_8,i_6);
fprintf('Average density = %d veh/km \n',AvgDensity);
fprintf('Average volume = %d veh/h \n',AvgVolume);
fprintf('Average speed = %d km/h \n',AvgSpeed);
fprintf('Average speed of AV = %d km/h \n',AvgSpeed_av);
numofAV=i_8+i_7;
numofHV=i_3+i_4-numofAV;
numofAll=i_3+i_4;
AvgSpeed_hv=(numofAll*AvgSpeed-AvgSpeed_av*numofAV)/numofHV;
fprintf('Average speed of HV = %d km/h \n',AvgSpeed_hv);
                         