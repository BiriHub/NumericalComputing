function [x_coord, y_coord]= dataNuclear()
% The function returns the nuclear power consumption data

data = [
1999	14.09	4.68 
2000	15.90	12.85
2001	16.60	4.40 
2002	25.17	51.63
2003	41.66	65.51
2004	47.95	15.10
2005	50.33	4.96 
2006	54.85	8.98 
];

x_coord = (1:size(data,1))';
y_coord = data(:, 2);
end

