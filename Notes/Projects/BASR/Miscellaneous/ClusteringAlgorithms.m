load fisheriris
data = meas(:,3:4);
% rng default; % For reproducibility
% data = [randn(100,2)*0.75+ones(100,2);
%     randn(100,2)*0.5-ones(100,2)];

data_m = data;
k = 2;

% center1(1) = randi([ceil(min(data(:, 1))), floor(max(data(:, 1)))]);
% center1(2) = randi([ceil(min(data(:, 2))), floor(max(data(:, 2)))]);
% center2(1) = randi([ceil(min(data(:, 1))), floor(max(data(:, 1)))]);
% center2(2) = randi([ceil(min(data(:, 2))), floor(max(data(:, 2)))]);
center(1, :) = [0, 0];
center(2, :) = [.1, .1];

for i = 1: 3
	g1 = [];
	g2 = [];
% 	d1(:, 1) = sqrt((data(:, 1) - center1(1)) .^ 2);
% 	d1(:, 2) = sqrt((data(:, 2) - center1(2)) .^ 2);
	distance1 = sqrt((data(:, 1) - center(1, 1)) .^ 2 + (data(:, 2) - center(1, 2)) .^ 2);
	
% 	d2(:, 1) = sqrt((data(:, 1) - center2(1)) .^ 2);
% 	d2(:, 2) = sqrt((data(:, 2) - center2(2)) .^ 2);
	distance2 = sqrt((data(:, 1) - center(2, 1)) .^ 2 + (data(:, 2) - center(2, 2)) .^ 2);
	
% 	distance1 = pdist2(data, center1);
% 	distance2 = pdist2(data, center2);
	
	for j = 1: length(data)
		if (distance1(j) < distance2(j))
			g1(end + 1, :) = data(j, :);
		else
			g2(end + 1, :) = data(j, :);
		end
	end
	
	if not(isempty(g1))
		center(1, 1) = mean(g1(:, 1));
		center(1, 2) = mean(g1(:, 2));
	end
	if not(isempty(g2))
		center(2, 1) = mean(g2(:, 1));
		center(2, 2) = mean(g2(:, 2));
	end
end

hold on
% plot(data(:, 1), data(:, 2), '.')
plot(g1(:, 1), g1(:, 2), 'r.', 'MarkerSize', 12)
plot(g2(:, 1), g2(:, 2), 'b.', 'MarkerSize', 12)
plot(center(1, 1), center(1, 2), '*')
plot(center(2, 1), center(2, 2), 'kx')
hold off










% load fisheriris
% data = meas(:,3:4);
% % rng default; % For reproducibility
% % data = [randn(100,2)*0.75+ones(100,2);
% %     randn(100,2)*0.5-ones(100,2)];
% k = 2;
% 
% distance = zeros(length(data), k);
% data_m = [data, zeros(length(data), 1)];
% 
% center(1, :) = [0, 0];
% center(2, :) = [.1, .1];
% 
% for i = 1: 4
% 	g1 = [];
% 	g2 = [];
% 	
% 	for j = 1: k
% 		distance(:, j) = sqrt((data(:, 1) - center(j, 1)) .^ 2 + (data(:, 2) - center(j, 2)) .^ 2);
% 	end
% 	
% 	for j = 1: length(data)
% 		if (distance(j, 1) < distance(j, 2))
% 			data_m(j, 3) = 1;
% 		else
% 			data_m(j, 3) = 2;
% 		end
% 	end
% 	
% 	if length((data_m(:, 3) == 1) >= 1)
% 		center(1, 1) = mean(data_m(data_m(:, 3) == 1, 1));
% 		center(1, 2) = mean(data_m(data_m(:, 3) == 1, 2));
% 	end
% 	center(2, 1) = mean(data_m(data_m(:, 3) == 2, 1));
% 	center(2, 2) = mean(data_m(data_m(:, 3) == 2, 2));
% 	
% % 	if not(isempty(g1))
% % 		center(1, 1) = mean(g1(:, 1));
% % 		center(1, 2) = mean(g1(:, 2));
% % 	end
% % 	if not(isempty(g2))
% % 		center(2, 1) = mean(g2(:, 1));
% % 		center(2, 2) = mean(g2(:, 2));
% % 	end
% end
% 
% hold on
% % plot(data(:, 1), data(:, 2), '.')
% plot(data_m(data_m(:, 3) == 1, 1), data_m(data_m(:, 3) == 1, 2), 'r.', 'MarkerSize', 12)
% plot(data_m(data_m(:, 3) == 2, 1), data_m(data_m(:, 3) == 2, 2), 'b.', 'MarkerSize', 12)
% plot(center(1, 1), center(1, 2), '*')
% plot(center(2, 1), center(2, 2), 'kx')
% hold off
