function [theta1, theta2] = nguoc(x,y)
 [L1, L2] = parameter();
 theta2 = acos((x^2+y^2-L1^2-L2^2)/(2*L1*L2));
  if (x < 0) && (y < 0)
    theta2 = (-1) * theta2;
  end
  theta1 = atan(x / y) - atan((L2 * sin(theta2)) / (L1 + L2 * cos(theta2)));
  theta2 = (-1) * theta2 * 180 / pi;
  theta1 = theta1 * 180 / pi;

 % Angles adjustment depending in which quadrant the final tool coordinate x,y is
  if (x >= 0) & (y >= 0)       % 1st quadrant
    theta1 = 90 - theta1;
  end
  if (x < 0) & (y > 0)        % 2nd quadrant
    theta1 = 90 - theta1;
  end
  if (x < 0) & (y < 0)       % 3d quadrant
    theta1 = 270 - theta1;
  end
  if (x > 0) & (y < 0)        % 4th quadrant
    theta1 = -90 - theta1;
  end
  if (x < 0) & (y == 0)
    theta1 = 270 + theta1;
  end

  theta1=round(theta1);
  theta2=round(theta2);
end