function [speedRear, RearDistance] = GetRearVehicle( LINK,indexOfCell,numOfCell)
  
startIndex = indexOfCell-1;       %����ʼ��Ǹ�Ϊ��ǰԪ���ı��-1
endIndex = indexOfCell+1-numOfCell; 

RearDistance=numOfCell-1;        %�ȼ������һֱû�г�
speedRear=0;

for cell_i=startIndex:-1:endIndex
    if cell_i<1 % out of link %�������Ԫ����㣬��������·ĩ��
        if ~isnan(LINK(cell_i+numOfCell))
            RearDistance=indexOfCell-cell_i;
            speedRear=LINK(cell_i+numOfCell);
            break;
        end
    else % in link
        if ~isnan(LINK(cell_i))
            RearDistance=indexOfCell-cell_i;
            speedRear=LINK(cell_i);
            break;
        end
    end        
        
end