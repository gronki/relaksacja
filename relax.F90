program relax

    use common
    integer :: i,j
    integer :: niter
    real(dp) :: xm,ym

    call init_x()

    niter = nn*2

    forall (i=1:nn)
        y(i) = (nn-i) / real(nn-1,dp) * y0
    end forall

    iterate: do j=1,niter
        yt = y
        do concurrent (i=1:nn-1)
            xm = ( x(i+1) + x(i) ) / 2
            ym = ( y(i+1) + y(i) ) / 2
            y(i+1) = yt(i) - ( x(i+1) - x(i) ) * k * ym * xm**g
        end do
    end do iterate

    call write_results("relax.dat")

end program
