module common

    integer, parameter :: nn = 50
    integer, parameter :: dp = selected_real_kind(12)

    real(dp), dimension(nn) :: x,y,yt
    real(dp) :: y0 = 1
    real(dp) :: k  =  8, g = 0.125

contains

    subroutine init_x()
        integer :: i

        forall (i=1:nn)
            x(i) = (i-1) / real(nn-1,dp)
        end forall
    end subroutine

    subroutine write_results(f)
        character(len=*), intent(in) :: f
        integer :: i

        open(33, file=f, action="write")

        do i=1,nn
            write (33,'(I12,2Es12.4)') i, x(i), y(i)
        end do

        close(33)

    end subroutine write_results

end module
