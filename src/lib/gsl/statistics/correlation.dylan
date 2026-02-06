Module: gsl-statistics-impl
Synopsis: Correlation
Author: Fernando Raya
Copyright: Copyright (C) 2026, Dylan Hackers. All rights reserved.
License: See LICENSE in this distribution for details.

define function correlation
  (data1 :: <vector>, data2 :: <vector>,
   #key stride1 :: <integer> = 1,
        stride2 :: <integer> = 1)
  => (correlation :: <double-float>)
  with-c-double-array (c-data1 = data1)
    with-c-double-array (c-data2 = data2)
      gsl-stats-correlation(c-data1, stride1, c-data2, stride2, data1.size)
    end
  end
end;

define function spearman
  (data1 :: <vector>, data2 :: <vector>, work :: <vector>,
   #key stride1 :: <integer> = 1,
        stride2 :: <integer> = 1)
  => (correlation-sd :: <double-float>)
  with-c-double-array (c-data1 = data1)
    with-c-double-array (c-data2 = data2)
      with-c-double-array (c-work = work)
        gsl-stats-spearman(c-data1, stride1, c-data2, stride2, data1.size, c-work)
      end
    end
  end
end;
