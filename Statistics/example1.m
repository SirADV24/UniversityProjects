
x1 = [21.8, 22.6, 21.0, 19.7, 21.9, 21.6,22.5,23.1,22.2,20.1,21.4,20.5];
x2 = [36.5,35.2,36.2,34.0,36.4,36.1,37.5,38.0,36.3,35.9,35.7,34.9];


n1 = length(x1); n2 = length(x2);
alpha = input('significance level alpha = ');

m1 = mean(x1); m2 = mean(x2); mdiff = m1 - m2;
v1 = var(x1); v2 = var(x2); 

f1 = finv(alpha/2, n1 - 1, n2 - 1);
f2 = finv(1 - alpha/2, n1 - 1, n2 - 1); % quantiles for two-tailed test (for rejection region)


[H, P, CI, stats] = vartest2(x1, x2,"alpha", alpha);
fprintf('\n part a. Comparing variances\n')
fprintf('Two-tailed test for comparing variances\n')
if H == 0
    fprintf('H is %d\n', H)
    fprintf('So the null hypothesis is not rejected,\n')
    fprintf('i.e. the populations do not seef to differ\n')
    fprintf('the rejection region for F is (%6.4f, %6.4f) U (%6.4f, %6.4f)\n', -inf, f1, f2, inf)
    fprintf('the value of the test statistic F is %6.4f\n', stats.fstat)
    fprintf('the P-value for the variances test is %6.4f\n', P)
else
    fprintf('H is %d\n', H)
    fprintf('So the null hypothesis is rejected,\n')
    fprintf('i.e. the populations seem to differ\n')
    fprintf('the rejection region for F is (%6.4f,%6.4f)U(%6.4f,%6.4f)\n', -inf, f1, f2, inf)
    fprintf('the value of the test statistic F is %6.4f\n', stats.fstat)
    fprintf('the P-value for the variances test is %6.4f\n', P)
end

% part b
fprintf('\n part b.\n')
oneminusalpha = input('conf. level 1 - alpha = ');  % oneminusalpha = 1-alpha
alpha = 1 - oneminusalpha;

%sigma1 = sigma2
sp  =sqrt(((n1 - 1) * v1 + (n2 - 1) * v2)/(n1 + n2 - 2)); % pooled std. dev.
n = n1 + n2 - 2;
q = tinv(1 - alpha / 2, n);
ci1 = mdiff - q  *sp * sqrt(1/n1 + 1/n2);
ci2 = mdiff + q * sp * sqrt(1/n1 + 1/n2);
%fprintf('Difference of sample means:%4.3f\n', m)
fprintf('Conf. interval for diff. of means, variances equal (m1, m2) = (%4.3f, %4.3f)\n',ci1, ci2)

%sigma1 != sigma2
c = (v1 / n1)/(v1 / n1 + v2/n2);
%nn=ceil(1/(c^2/(n1-1)+(1-c)^2/(n2-1)));
nn = 1/(c^2/(n1 - 1) + (1 - c)^2/(n2 - 1));
s = sqrt(v1/n1+v2/n2);
qq=tinv(1 - alpha/2, nn);
ci3 = mdiff - qq * s; ci4 = mdiff + qq * s;
fprintf('Conf. interval for diff. of means, variances not equal (mm1, mm2) = (%4.3f, %4.3f)\n',ci3, ci4)
