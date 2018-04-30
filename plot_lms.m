function [] = plot_lms(v, v_kMinus1, s, m, alpha, e, r, X, Y)
%plot_lms plot results of LMS algorythim
    % v - raw input noise near noise source
    % s - pure input signal
    % m - percieved noise near input signal
    % alpha - learning rate
    % v_kMinus1 - v(k-1)
    % e - error
    % r - restored signal
    % X - W11 history
    % Y - W12 history
    
    figure;
    subplot(3,1,1);

    plot(s, '- red');

    hold on;
    plot(r, '-- blue');
    title(['Original (red) and restored signal (blue), alpha = ' num2str(alpha)]);
    subplot(3,1,2);
    plot(e,'blue');
    title(['Original minus restored signal (overall error), alpha = ' num2str(alpha)]);

    %% Countor Plot
    R=cov(v,v_kMinus1) % correct
    h=[mean((s+m).*v) mean((s+m).*v_kMinus1)]' % correct
    c=mean((s+m).^2) % correct
    
    [eigenVectorsR, eigenValuesR] = eig(R);
    
    eigenVectorsR
    eigenValuesR
    maxAlpha = 1 / max(eigenValuesR(:))
    
    xStar=R^-1*h

    [x,y] = meshgrid(-2:.01:2,-2:.01:2);
    [j,k]=size(x);
    z=zeros(j,k);

    for m=1:j
        for n=1:k
            z(m,n) = c-2*[x(m,n);y(m,n)]'*h+[x(m,n);y(m,n)]'*R*[x(m,n);y(m,n)];
        end
    end

    subplot(3,1,3);
    contour(x,y,z);
    hold on;
    plot(X,Y, '-o');
    title('Contour plot of W over time');
end