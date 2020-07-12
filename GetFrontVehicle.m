function [speedFront, FrontDistance] = GetFrontVehicle( LINK,indexOfCell,numOfCell)
             
startIndex = indexOfCell+1;       %����ʼ��Ǹ�Ϊ��ǰԪ���ı��+1
endIndex = indexOfCell-1+numOfCell;
FrontDistance=numOfCell-1;   %�ȼ���ǰ��һֱû�г�
speedFront=0;
for cell_i=startIndex:1:endIndex
    if cell_i > numOfCell  % out of link
        if ~isnan(LINK(cell_i-numOfCell))
            FrontDistance=cell_i-indexOfCell;
            speedFront=LINK(cell_i-numOfCell);
            break;
        end
    else % in link
        if ~isnan(LINK(cell_i))
            FrontDistance=cell_i-indexOfCell;
            speedFront=LINK(cell_i);
            break;
        end
    end        
        
end

