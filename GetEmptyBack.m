function [emptyBackD,vBack] = GetEmptyBack(LINK, maxSpeed, indexOfCell,numOfCell)

        emptyBackD=0;                   %��û��ͨ�пռ�
        vBack=0;                        %�󷽳���Ϊ0
        startIndex=indexOfCell-1;      %����ʼ��Ǹ�Ϊ��ǰԪ���ı��-1 
        endIndex=indexOfCell-maxSpeed;  %%��������Ǹ�Ϊ��ǰԪ���ı��-����ٶ�

        for cell_i=startIndex:-1:endIndex
            if cell_i<1 % out of link %�������Ԫ����㣬��������·ĩ��
                if ~isnan(LINK(cell_i+numOfCell)) % occupied
                    vBack=LINK(cell_i+numOfCell);
                    break;
                else
                    emptyBackD=emptyBackD+1;
                end
            else % still on a link            %���δ����Ԫ�����
                if ~isnan(LINK(cell_i)) % occupied  %�������nan,��������ǰѭ��
                    vBack=LINK(cell_i);
                    break;
                else       %�����nan����ǰ���ռ�+1
                    emptyBackD=emptyBackD+1;
                end
            end
        end        
        
end
