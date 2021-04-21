%% Enconding the natural visibility graph
%the DC method O(nlogn)
%Ref: Fast transformation from time series tovisibility graphs, https://doi.org/10.1063/1.4927835
%the input is the time series
% Created by Yusheng Huang, April, 2021.
function [out_degree_in, out_degree_out, out_degree_sum]=...
    NVGcode_DC(t_series, index_left,index_right,degree_in, degree_out, degree_sum)
%% variables
%input: Encode the whole t_series into the motif. The motif size equals to the length of the time series. 
%t_series=randn(1,10);%place holder of the input time series
%necessary variable
length_t=index_right-index_left+1;%the length of the time series
%% DC
index_max=find(t_series(index_left:index_right)==max(t_series(index_left:index_right)));%not an index, but bias
index_max=index_max(1)+index_left-1;% The real index max.
if length_t>=2
    %% left visibility check
    matrix_minslope=Inf;
    for iijj=index_max-1:-1:index_left
        tmp_slope=(t_series(index_max)-t_series(iijj))/(index_max-iijj);
        %Visibility  check, still use the maximum slop e idea.
        if tmp_slope<=matrix_minslope% have visibility
            %it already consider the negative slope
            matrix_minslope=tmp_slope; % could be negative
            degree_sum(index_max)=degree_sum(index_max)+1;
            degree_sum(iijj)=degree_sum(iijj)+1;
            if tmp_slope>0%  iijj is smaller than index_max, thus index_max sees iijj
                degree_in(iijj)=degree_in(iijj)+1;%ii being seen
                degree_out(index_max)=degree_out(index_max)+1; % index_max sees iijj
            elseif tmp_slope<0% iijj is larger than index_max, thus iijj sees index_max
                degree_in(index_max)=degree_in(iijj)+1;
                degree_out(iijj)=degree_out(iijj)+1;
            else %when the slope is 0, the two node could see each other
                degree_out(iijj)=degree_out(iijj)+1;
                degree_in(iijj)=degree_in(iijj)+1;
                degree_out(index_max)=degree_out(index_max)+1;
                degree_in(index_max)=degree_in(index_max)+1;
            end
        end
    end
    %% rigth visibility check
    matrix_maxslope=-Inf;
    for iijj=index_max+1:index_right
        tmp_slope=(t_series(iijj)-t_series(index_max))/(iijj-index_max);
        %Visibility  check, still use the maximum slop e idea.
        if tmp_slope>=matrix_maxslope% have visibility
            %it already consider the negative slope
            matrix_maxslope=tmp_slope; % could be negative
            degree_sum(index_max)=degree_sum(index_max)+1;
            degree_sum(iijj)=degree_sum(iijj)+1;
            if tmp_slope<0%  ii is smaller than iijj, thus iijj sees ii
                degree_in(iijj)=degree_in(iijj)+1;%ii being seen
                degree_out(index_max)=degree_out(index_max)+1; % iijj sees ii
            elseif tmp_slope>0% ii is larger than iijj, thus ii sees iijj
                degree_in(index_max)=degree_in(index_max)+1;
                degree_out(iijj)=degree_out(iijj)+1;
            else %when the slope is 0, the two node could see each other
                degree_out(iijj)=degree_out(iijj)+1;
                degree_in(iijj)=degree_in(iijj)+1;
                degree_out(index_max)=degree_out(index_max)+1;
                degree_in(index_max)=degree_in(index_max)+1;
            end
        end
    end
    %% Divide and concur
    if length_t>2
        if index_max==index_left
            [degree_in, degree_out, degree_sum]=...
                NVGcode_DC(t_series, index_max+1, index_right,degree_in, degree_out, degree_sum);
        elseif index_max==index_right
            [degree_in, degree_out, degree_sum]=...
                NVGcode_DC(t_series, index_left,index_max-1,degree_in, degree_out, degree_sum);
        else
            [degree_in, degree_out, degree_sum]=...
                NVGcode_DC(t_series, index_left,index_max-1,degree_in, degree_out, degree_sum);
            [degree_in, degree_out, degree_sum]=...
                NVGcode_DC(t_series, index_max+1, index_right,degree_in, degree_out, degree_sum);
        end
    end
end

out_degree_in=degree_in;
out_degree_out=degree_out;
out_degree_sum=degree_sum;
end
