close all
clear all
clc



% % % 2023.02.22
% % % K-Means implementation 1
% 
% load fisheriris
% data = meas(:,3:4);
% rng default; % For reproducibility
% data = [randn(100,2)*0.75+ones(100,2);
%     randn(100,2)*0.5-ones(100,2)];
% 
% data_m = data;
% k = 2;
% 
% % center1(1) = randi([ceil(min(data(:, 1))), floor(max(data(:, 1)))]);
% % center1(2) = randi([ceil(min(data(:, 2))), floor(max(data(:, 2)))]);
% % center2(1) = randi([ceil(min(data(:, 1))), floor(max(data(:, 1)))]);
% % center2(2) = randi([ceil(min(data(:, 2))), floor(max(data(:, 2)))]);
% center(1, :) = [0, 0];
% center(2, :) = [.1, .1];
% 
% for i = 1: 3
% 	
% 	g1 = [];
% 	g2 = [];
% 	
% % 	d1(:, 1) = sqrt((data(:, 1) - center1(1)) .^ 2);
% % 	d1(:, 2) = sqrt((data(:, 2) - center1(2)) .^ 2);
% 	distance1 = sqrt((data(:, 1) - center(1, 1)) .^ 2 + (data(:, 2) - center(1, 2)) .^ 2);
% % 	d2(:, 1) = sqrt((data(:, 1) - center2(1)) .^ 2);
% % 	d2(:, 2) = sqrt((data(:, 2) - center2(2)) .^ 2);
% 	distance2 = sqrt((data(:, 1) - center(2, 1)) .^ 2 + (data(:, 2) - center(2, 2)) .^ 2);
% % 	distance1 = pdist2(data, center1);
% % 	distance2 = pdist2(data, center2);
% 	
% 	for j = 1: length(data)
% 		if (distance1(j) < distance2(j))
% 			g1(end + 1, :) = data(j, :);
% 		else
% 			g2(end + 1, :) = data(j, :);
% 		end
% 	end
% 	
% 	if not(isempty(g1))
% 		center(1, 1) = mean(g1(:, 1));
% 		center(1, 2) = mean(g1(:, 2));
% 	end
% 	if not(isempty(g2))
% 		center(2, 1) = mean(g2(:, 1));
% 		center(2, 2) = mean(g2(:, 2));
% 	end
% 	
% end
% 
% hold on
% % plot(data(:, 1), data(:, 2), '.')
% plot(g1(:, 1), g1(:, 2), 'r.', 'MarkerSize', 12)
% plot(g2(:, 1), g2(:, 2), 'b.', 'MarkerSize', 12)
% plot(center(1, 1), center(1, 2), '*')
% plot(center(2, 1), center(2, 2), 'kx')
% hold off










% % 2023.02.23
% % K-Means implementation 2

load fisheriris

k = 2;
data = meas(:,3:4);
% rng default; % For reproducibility
% data = [randn(100,2)*0.75+ones(100,2);
%     randn(100,2)*0.5-ones(100,2)];

colors = ['r', 'g', 'b', 'm', 'k', 'c'];
symbols = ['x', '+', '*', 'o', 's', 'd'];
distance = zeros(size(data, 1), k);
[m, n] = size(data);
center = zeros(k, n);
for i = 1: k
	center(i, :) =  data(i, :);
end

for i = 1: 20
	for j = 1: size(center, 1)
		tempCenter = center(j, :);
		tempDistance = sqrt(sum((data - tempCenter) .^ 2, 2));
		distance(:, j) = tempDistance;
	end
	
	[M, I] = min(distance, [], 2);
	
	for j = 1: k
		if not(isempty(data(I == j, :)))
			center(j, :) = mean(data(I == j, :));
		end
	end
end

hold on
for i = 1: m
	color_index = mod(i - 1, length(colors)) + 1;
    color = colors(color_index); 
    plot(data(I == i, 1), data(I == i, 2), '.', 'MarkerSize', 10, 'Color', color);
end
for i = 1: k
	symbol_index = mod(i - 1, length(symbols)) + 1;
	symbol = symbols(symbol_index);
	plot(center(i, 1), center(i, 2), symbol, 'MarkerSize', 15)
end
hold off
