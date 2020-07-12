function emptyFront = GetEmptyFront(LINK, numOfCell, maxSpeed, indexOfCell)
    
    emptyFront=0;                   %���ȼ���ǰ��û��ͨ�пռ�
    startIndex=indexOfCell+1;       %����ʼ��Ǹ�Ϊ��ǰԪ���ı��+1
    endIndex=indexOfCell+maxSpeed;  %��������Ǹ�Ϊ��ǰԪ���ı��+����ٶ�

    for cell_i=startIndex:1:endIndex
        if cell_i>numOfCell % out of link %�������Ԫ�����ȣ���ӳ�ʼλ�ÿ�ʼ����
            if ~isnan(LINK(cell_i-numOfCell)) % occupied
                break;
            else
                emptyFront=emptyFront+1;
            end
        else % still on a link            %���δ����Ԫ������,���������
            if ~isnan(LINK(cell_i)) % occupied  %�������nan,��������ǰѭ��,��ǰ������ΪԪ��ֵ
                break;
            else       %�����nan�Ҳ����������������ǰ���ռ�+1
                emptyFront=emptyFront+1;
            end
        end
    end        
        
    end


