%% Enconding the H visibility graph 
%the maximum height method O(n^2), space O(n^2)
%the input is the time series
% Created by Yusheng Huang, April, 2021.
function [degree_in, degree_out, degree_sum]= HVGcode(t_series)
%% variables
%input: Encode the whole t_series into the motif. The motif size equals to the length of the time series. 
%t_series=randn(1,10);%place holder of the input time series
%necessary variable
length_t=length(t_series);%the length of the time series 
%matrix_maxslope(i,j) store the maximum slope between t(i) and t(j)
%output
degree_in=zeros(1,length_t);%being seen
degree_out=zeros(1,length_t);%seeing others 
degree_sum=zeros(1,length_t);%the number of being seen or seeing others
% (degree_sum: see and being seen only count ONCE!)
%% main iterations 
for ii=1:length_t-1 %ii the prior index 
    maxheight=-Inf;
    for iijj=ii+1:length_t
        %visibility  check
        if t_series(iijj)<=maxheight || t_series(ii)<=maxheight
            continue;
        else
            maxheight=max([t_series(iijj),t_series(ii),maxheight]);
            if t_series(iijj)==t_series(ii)% the two node could see each other
                degree_out(ii)=degree_out(ii)+1;
                degree_in(ii)=degree_in(ii)+1;
                degree_out(iijj)=degree_out(iijj)+1;
                degree_in(iijj)=degree_in(ii)+1;
            elseif t_series(iijj)>t_series(ii)%  ii is smaller than iijj, thus iijj sees ii
                degree_in(ii)=degree_in(ii)+1;%ii being seen
                degree_out(iijj)=degree_out(iijj)+1; % iijj sees ii
            else% ii is larger than iijj, thus ii sees iijj
                degree_in(iijj)=degree_in(ii)+1;
                degree_out(ii)=degree_out(ii)+1;
            end
        end
    end
end
end