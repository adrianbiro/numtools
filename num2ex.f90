program num2ex
! echo 9 | num2ex
! 0.900E+01
! max 0.999E+38
    implicit none
    real :: num
    read *, num
    print "(e10.3)", num

end program num2ex
