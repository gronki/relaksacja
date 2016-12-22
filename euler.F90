program euler

    use common

    integer :: i

    call init_x()

    y(1) = y0

    main_loop: do i=1,nn-1
        y(i+1) = y(i) - ( x(i+1) - x(i) ) * k * y(i) * x(i)**g
    end do main_loop

    call write_results("euler.dat")


end program
